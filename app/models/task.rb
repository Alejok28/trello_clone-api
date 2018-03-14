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

class Task < ApplicationRecord
  belongs_to :list
  validates :name, :description, presence: true
end
