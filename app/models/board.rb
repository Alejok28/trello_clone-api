class Board < ApplicationRecord
  validates :name, presence: true
  validates :title, presence: true

end
