require 'just_xiangqi/errors/error'

module JustXiangqi

  # = MovedIntoCheckError
  #
  # A moved into check error with a message
  class MovedIntoCheckError < Error

    # New moved into check errors can be instantiated with
    #
    # @option [String] message
    #   the message to display.
    #
    # ==== Example:
    #   # Instantiates a new MovedIntoCheckError
    #   JustXiangqi::MovedIntoCheckError.new("Custom Message")
    def initialize(message="This move would leave the ou in check.")
      super
    end
  end
end

