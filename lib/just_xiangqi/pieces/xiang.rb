require 'just_xiangqi/pieces/piece'

module JustXiangqi

  # = Xiang
  #
  # The piece that can move 2 spaces diagonally on its side of the river
  class Xiang < Piece
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
      players_side_squares(game_state).diagonal(square).at_range(square, 2).unoccupied_or_occupied_by_opponent(player_number) 
    end

    private

    def players_side_squares(game_state)
      condition = player_number == 2 ? -> (y) { y <= 4 } : -> (y) { y >= 5 }
      game_state.squares.where(y: condition)
    end
  end
end
