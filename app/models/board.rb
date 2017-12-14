# == Schema Information
#
# Table name: boards
#
#  id          :integer          not null, primary key
#  name        :string
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Board < ApplicationRecord
  has_many :lists
  validates :name, presence: true
  validates :description , presence: true

end
