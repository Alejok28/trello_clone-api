module Api
  module V1
    class BoardsController < ApplicationController

      def index
        boards = Board.all
        render json: boards
      end

      def show
        board = Board.find(params[:id])
        render json: board
      end

      def create
        board = Board.new(boards_params)
        if board.save
          render json: board, status: 201
        else
          render json: { errors: board.errors }, status: 422
        end
      end

      def update
        board = Board.find(params[:id])
        if board.update(boards_params)
          render json: board, status: 200
        else
          render json: { errors: board.errors }, status: 422
        end
      end

      def destroy
        board = Board.find(params[:id])
        board.destroy
        head :no_content
      end

      private
      def boards_params
        params.require(:boards).permit(:name, :description)
      end

    end
  end
end
