require 'just_xiangqi/pieces/piece'

module JustXiangqi
  # = Ju
  #
  # The piece that can move orthogonally.
  class Ju < Piece
    # All the squares that the piece can move to and/or capture.
    #
    # @param [Square] square
    #   the origin square.
    #
    # @param [GameState] game_state
    #   the current game state.
    def destinations(square, game_state)
      game_state.squares.orthogonal(square).unoccupied_or_occupied_by_opponent(player_number).unblocked(square, game_state.squares)
    end
  end
end
