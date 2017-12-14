class ApplicationController < ActionController::API
  def get_current_board
    # get to board_id in the url
    @board = Board.find(params[:board_id])
  end
end
