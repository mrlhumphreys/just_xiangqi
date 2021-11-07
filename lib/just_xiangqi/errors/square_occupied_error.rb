require 'just_xiangqi/errors/error'

module JustXiangqi

  # = SquareOccupiedError
  #
  # A square occupied error with a message
  class SquareOccupiedError < Error

    # New square occupied errors can be instantiated with
    #
    # @option [String] message
    #   the message to display.
    #
    # ==== Example:
    #   # Instantiates a new SquareOccupiedError 
    #   JustXiangqi::SquareOccupiedError.new("Custom Message")
    def initialize(message="Square is already occupied.")
      super
    end
  end
end

