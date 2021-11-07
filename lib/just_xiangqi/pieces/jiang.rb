require 'just_xiangqi/pieces/piece'

module JustXiangqi
  
  # = Jiang
  #
  # The piece that can move 1 space orthogonally within the palace.
  class Jiang < Piece
    PALACE_X_COORDINATES = [3, 4, 5]
    PALACE_Y_COORDINATES = [0, 1, 2, 7, 8, 9]

    # All the squares that the piece can move to and/or capture.
    #
    # @param [Square] square
    #   the origin square.
    #
    # @param [GameState] game_state
    #   the current game state.
    #
    # @return [SquareSet]
    def destinations(square, game_state)
      palace_squares(game_state).orthogonal(square).at_range(square, 1).unoccupied_or_occupied_by_opponent(player_number)
    end

    private

    def palace_squares(game_state)
      game_state.squares.where(x: PALACE_X_COORDINATES, y: PALACE_Y_COORDINATES) 
    end
  end
end
