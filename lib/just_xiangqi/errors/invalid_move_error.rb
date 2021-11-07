require 'just_xiangqi/errors/error'

module JustXiangqi
  
  # = InvalidMoveError
  #
  # An invalid move error with a message
  class InvalidMoveError < Error

    # New invalid move errors can be instantiated with
    #
    # @option [String] message
    #   the message to display.
    #
    # ==== Example:
    #   # Instantiates a new InvalidMoveError
    #   JustXiangqi::InvalidMoveError.new("Custom Message")
    def initialize(message="Move is invalid.")
      super 
    end
  end
end

