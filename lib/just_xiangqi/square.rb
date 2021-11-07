require 'just_xiangqi/piece_factory'
require 'board_game_grid'

module JustXiangqi

  # = Square
  #
  # A Square on a shogi board.
  class Square < BoardGameGrid::Square

    # New object can be instantiated by passing in a hash with
    #
    # @param [String] id
    #   the unique identifier of the square.
    #
    # @param [Fixnum] x
    #   the x co-ordinate of the square.
    #
    # @param [Fixnum] y
    #   the y co-ordinate of the square.
    #
    # @option [Piece,Hash,NilClass] piece
    #   The piece on the square, can be a piece object or hash or nil.
    #
    # ==== Example:
    #   # Instantiates a new Square
    #   JustXiangqi::Square.new({
    #     id: '91',
    #     x: 0,
    #     y: 0,
    #     piece: { id: 1, player_number: 1, type: 'zu' }
    #   })
    def initialize(id: , x: , y: , piece: nil)
      @id = id
      @x = x
      @y = y
      @piece = PieceFactory.new(piece).build
    end
  end
end

