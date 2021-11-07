require 'just_xiangqi/pieces/piece'

require 'board_game_grid'

module JustXiangqi
  # = Ju
  #
  # The piece that can move orthogonally and captures by jumping over
  class Pao < Piece
    MOVEMENT_VECTORS = [
      BoardGameGrid::Point.new(0, -1),
      BoardGameGrid::Point.new(1, 0),
      BoardGameGrid::Point.new(0, 1),
      BoardGameGrid::Point.new(-1, 0)
    ]

    # All the squares that the piece can move to and/or capture.
    #
    # @param [Square] square
    #   the origin square.
    #
    # @param [GameState] game_state
    #   the current game state.
    def destinations(square, game_state)
      move_squares(square, game_state) + capture_squares(square, game_state)
    end

    private

    def move_squares(square, game_state)
      game_state.squares.orthogonal(square).unoccupied.unblocked(square, game_state.squares)
    end

    def capture_squares(square, game_state)
      squares = []
      MOVEMENT_VECTORS.each do |vector|
        current_point = square.point + vector 
        current_square = game_state.squares.find_by_x_and_y(current_point.x, current_point.y)

        # iterate through unoccupied square until end of board or occupied opponent square is reached
        while !current_square.nil? && current_square.unoccupied?
          current_point = current_square.point + vector
          current_square = game_state.squares.find_by_x_and_y(current_point.x, current_point.y)
        end

        # find the next square after the occupied square
        if current_square&.occupied_by_opponent?(player_number)
          next_point = current_square.point + vector
          next_square = game_state.squares.find_by_x_and_y(next_point.x, next_point.y)
          # add the next square if it's unoccupied
          squares.push(next_square) if !next_square.nil? && next_square.unoccupied?
        end 
      end

      SquareSet.new(squares: squares)
    end
  end
end
