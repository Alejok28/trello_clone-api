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

class List < ApplicationRecord
  belongs_to :board
  validates :name, presence: true
end
