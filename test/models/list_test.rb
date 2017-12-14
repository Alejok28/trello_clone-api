# == Schema Information
#
# Table name: lists
#
#  id         :integer          not null, primary key
#  board_id   :integer
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_lists_on_board_id  (board_id)
#

require 'test_helper'

class ListTest < ActiveSupport::TestCase
  test "Shouldn't create a list without any parameter" do
    list = List.new()
    assert_not list.save
  end

  test "Shouldn't create a list without a title" do
    list = List.new()
    list.board = boards(:one)
    assert_not list.save
  end

  test "Shoudn't create a list without a board_id" do
    list = List.new(name: "new title")
    assert_not list.save
  end
end
