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

require 'test_helper'

class BoardTest < ActiveSupport::TestCase
  test "Shouldn't create board without name" do
    board = Board.new(description: "Hello world")
    assert_not board.save
  end

  test "Shouldn't create board without description" do
    board = Board.new(name: "Board Title")
    assert_not board.save
  end

  test "Title scope returns correct board" do
    board = Board.where(name: "MyString")
    assert_equal 2, board.length
  end
end
