require 'just_xiangqi/errors/error'

module JustXiangqi

  # = OffBoardError
  #
  # An off board error with a message
  class OffBoardError < Error

    # New off board errors can be instantiated with
    #
    # @option [String] message
    #   the message to display.
    #
    # ==== Example:
    #   # Instantiates a new OffBoardError
    #   JustXiangqi::OffBoardError.new("Custom Message")
    def initialize(message="Cannot move off board.")
      super 
    end
  end
end

