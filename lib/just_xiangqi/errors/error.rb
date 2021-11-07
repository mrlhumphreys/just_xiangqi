module JustXiangqi

  # = Error
  #
  # An error with a message
  class Error
    
    # New errors can be instantiated with
    #
    # @option [String] message
    #   the message to display.
    #
    # ==== Example:
    #   # Instantiates a new Error
    #   JustXiangqi::Error.new('Custom Message')
    def initialize(message='Genertic Error')
      @message = message 
    end
  end
end

