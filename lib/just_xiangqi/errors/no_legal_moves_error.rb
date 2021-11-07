require 'just_xiangqi/errors/error'

module JustXiangqi

  # = NoLegalMovesError 
  #
  # A no legal moves error with a message
  class NoLegalMovesError < Error

    # New no legal moves errors can be instantiated with
    #
    # @option [String] message
    #   the message to display.
    #
    # ==== Example:
    #   # Instantiates a new NoLegalMovesError 
    #   JustXiangqi::NoLegalMovesError.new("Custom Message")
    def initialize(message="Piece cannot move from that square.")
      super
    end
  end
end

