# == Schema Information
#
# Table name: tasks
#
#  id          :integer          not null, primary key
#  name        :string
#  description :text
#  done        :boolean          default(FALSE)
#  list_id     :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
# Indexes
#
#  index_tasks_on_list_id  (list_id)
#

require 'test_helper'

class TaskTest < ActiveSupport::TestCase
  test "Shouldn't create a task without any parameter" do
    task = Task.new
    assert_not task.save
  end

  test "Shouldn't create a task without title" do
    task = Task.new(description: "List description")
    task.list = lists(:one)
    assert_not task.save
  end

  test "Shouldn't create a task without description" do
    task = Task.new(name: "List title")
    task.list = lists(:one)
    assert_not task.save
  end

  test "Shouldn't create a task without list id" do
    task = Task.new(name: "List title", description:"List description")
    assert_not task.save
  end

  test "done scope only returns done tasks" do
    tasks = Task.where(done: true)
    assert_equal 1 , tasks.length

    assert_equal tasks(:done).id, tasks[0].id
  end

end
