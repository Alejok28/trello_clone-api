require 'test_helper'

class BoardsControllerTest < ActionDispatch::IntegrationTest
  # setup se corre antes de cada prueba
  setup do
    @board = Board.last
  end

  test "Get index: is successful" do
    get api_v1_boards_path
    assert_response :success
  end

  test "Get show: is successful" do
    get api_v1_boards_path(locale: 'es' , id: @board)
    assert_response :success
  end

  test "Post create: creates a board" do
    assert_difference 'Board.count', 1 do
      post api_v1_boards_path(locale: 'es' , id: @board), params:{ boards: {name: "new board", description: "new description"} }
      assert_response :success

      assert_equal "new board", Board.last.name
      assert_equal "new description", Board.last.description
    end
  end

  test "Put update: edits a board description" do
    assert_difference 'Board.count', 0 do
      put api_v1_board_path(locale: 'es' , id: @board), params:{ boards: { description: "Edited board description"} }
      assert_response :success

      assert_equal "Edited board description", Board.last.description
    end
  end

  test "Put update: edits a board title" do
    assert_difference 'Board.count', 0 do
      put api_v1_board_path(locale: 'es' , id: @board), params:{ boards: { name: "Edited board title"} }
      assert_response :success

      assert_equal "Edited board title", Board.last.name
    end
  end

  test "Delete destroy: destroys a board" do
    assert_difference 'Board.count', -1 do
      delete api_v1_board_path(locale: 'es' , id: @board)
      assert_response :success
    end
  end

end
