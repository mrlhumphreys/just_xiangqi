require 'just_xiangqi/pieces/jiang'
require 'just_xiangqi/pieces/ju'
require 'just_xiangqi/pieces/ma'
require 'just_xiangqi/pieces/pao'
require 'just_xiangqi/pieces/shi'
require 'just_xiangqi/pieces/xiang'
require 'just_xiangqi/pieces/zu'

module JustXiangqi

  # = Piece Factory
  #
  # Generates pieces from a hash of arguments
  class PieceFactory

    # A mapping of type descriptions to classes.
    CLASSES = {
      'jiang' => Jiang,
      'ju' => Ju,
      'ma' => Ma,
      'pao' => Pao,
      'shi' => Shi,
      'xiang' => Xiang,
      'zu' => Zu 
    }

    # New objects can be instantiated by passing in a hash or the piece.
    #
    # @param [Hash,Piece] args
    #   the initial attributes of the piece, hash requires type key
    #
    # ==== Example:
    #   # Instantiates a new PieceFactory
    #   JustXiangqi::PieceFactory.new({
    #     type: 'zu',
    #     id: 1,
    #     player_number: 2
    #   })
    def initialize(args)
      @args = args
    end

    # Returns a piece based on the initial arguments.
    #
    # @return [Piece]
    def build
      case @args
      when Hash
        build_from_hash
      when Piece
        @args
      when nil
        nil
      else
        raise ArgumentError, "piece must be Hash or NilClass"
      end
    end

    private

    def build_from_hash
      klass = CLASSES[@args[:type]]
      if klass
        klass.new(**@args)
      else
        raise ArgumentError, "invalid piece type: #{@args[:type].to_s}"
      end
    end
  end
end

