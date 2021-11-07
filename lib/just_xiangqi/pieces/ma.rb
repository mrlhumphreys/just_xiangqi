require 'just_xiangqi/pieces/piece'

module JustXiangqi
  # = Ma 
  #
  # The piece that can move in an l shape, but can be blocked by adjacent pieces.
  class Ma < Piece
    MOVEMENT_MAP = {
      [0,-1] => [[-1,-2], [1,-2]],
      [1,0] => [[2,-1], [2,1]],
      [0,1] => [[-1,2], [1,2]],
      [-1,0] => [[-2,-1], [-2,1]]
    }
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
      _squares = MOVEMENT_MAP.map do |adjacent_map, destinations_map|
        adjacent = find_square_by_displacement(square, game_state, adjacent_map)
        
        if adjacent.nil? || adjacent.occupied?
          nil
        else
          find_valid_destinations(square, game_state, destinations_map)
        end
      end.flatten.compact

      SquareSet.new(squares: _squares)
    end

    private

    def find_valid_destinations(square, game_state, destinations_map)
      destinations_map.map do |destination_map|
        find_valid_destination(square, game_state, destination_map)
      end
    end

    def find_valid_destination(square, game_state, destination_map)
      destination = find_square_by_displacement(square, game_state, destination_map)
      if destination && (destination.unoccupied? || destination.occupied_by_opponent?(player_number))
        destination
      else
        nil
      end
    end

    def find_square_by_displacement(square, game_state, displacement)
      x = square.x + displacement[0]
      y = square.y + displacement[1]
      game_state.squares.find_by_x_and_y(x, y)
    end
  end
end
