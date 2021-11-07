require 'just_xiangqi/pieces/piece'

module JustXiangqi
  # = Zu 
  #
  # The piece that can move one space forward and can also move one space horizontally when on the opposite side of the river. 
  class Zu < Piece
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
      same_file_forwards_and_or_same_rank(square, game_state).in_range(square, 1).unoccupied_or_occupied_by_opponent(player_number)
    end

    private

    def same_file_forwards_and_or_same_rank(square, game_state)
      if on_players_side(square)
        same_file_forwards(square, game_state) 
      else
        same_file_forwards(square, game_state) + same_rank(square, game_state)
      end
    end

    def same_file_forwards(square, game_state)
      game_state.squares.in_direction(square, forwards_direction).same_file(square)
    end

    def same_rank(square, game_state)
      game_state.squares.same_rank(square)
    end

    def on_players_side(square)
      (player_number == 2 && square.y <= 4) || (player_number == 1 && square.y >= 5) 
    end
  end
end
