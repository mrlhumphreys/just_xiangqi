require 'board_game_grid'

module JustXiangqi

  # = Piece
  #
  # A piece that can move on a board
  class Piece < BoardGameGrid::Piece
    def initialize(id: , player_number: , type: nil)
      @id = id
      @player_number = player_number
    end
  end
end
