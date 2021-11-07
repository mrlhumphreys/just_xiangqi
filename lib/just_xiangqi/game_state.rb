require 'just_xiangqi/errors/no_piece_error'
require 'just_xiangqi/errors/not_players_turn_error'
require 'just_xiangqi/errors/off_board_error'
require 'just_xiangqi/errors/invalid_move_error'
require 'just_xiangqi/errors/moved_into_check_error'
require 'just_xiangqi/errors/piece_not_found_error'
require 'just_xiangqi/errors/square_occupied_error'
require 'just_xiangqi/errors/no_legal_moves_error'
require 'just_xiangqi/square_set'

module JustXiangqi

  # = Game State
  #
  # Represents a game of Xiangqi in progress.
  class GameState
    def initialize(current_player_number: , squares: [])
      @current_player_number = current_player_number
      @squares = if squares.is_a?(SquareSet)
                   squares
                 else
                   SquareSet.new(squares: squares)
                 end
    end

    attr_reader :current_player_number, :squares, :errors

    # Instantiates a new GameState object in the starting position.
    #
    # @return [GameState]
    def self.default
      new(
        current_player_number: 1,
        squares: [
          { id: 'a10', x: 0, y: 0, piece: { id: 1, player_number: 2, type: 'ju' } },
          { id: 'b10', x: 1, y: 0, piece: { id: 2, player_number: 2, type: 'ma' } },
          { id: 'c10', x: 2, y: 0, piece: { id: 3, player_number: 2, type: 'xiang' } },
          { id: 'd10', x: 3, y: 0, piece: { id: 4, player_number: 2, type: 'shi' } },
          { id: 'e10', x: 4, y: 0, piece: { id: 5, player_number: 2, type: 'jiang' } },
          { id: 'f10', x: 5, y: 0, piece: { id: 6, player_number: 2, type: 'shi' } },
          { id: 'g10', x: 6, y: 0, piece: { id: 7, player_number: 2, type: 'xiang' } },
          { id: 'h10', x: 7, y: 0, piece: { id: 8, player_number: 2, type: 'ma' } },
          { id: 'i10', x: 8, y: 0, piece: { id: 9, player_number: 2, type: 'ju' } },

          { id: 'a9', x: 0, y: 1, piece: nil },
          { id: 'b9', x: 1, y: 1, piece: nil },
          { id: 'c9', x: 2, y: 1, piece: nil },
          { id: 'd9', x: 3, y: 1, piece: nil },
          { id: 'e9', x: 4, y: 1, piece: nil },
          { id: 'f9', x: 5, y: 1, piece: nil },
          { id: 'g9', x: 6, y: 1, piece: nil },
          { id: 'h9', x: 7, y: 1, piece: nil },
          { id: 'i9', x: 8, y: 1, piece: nil },

          { id: 'a8', x: 0, y: 2, piece: nil },
          { id: 'b8', x: 1, y: 2, piece: { id: 10, player_number: 2, type: 'pao' } },
          { id: 'c8', x: 2, y: 2, piece: nil },
          { id: 'd8', x: 3, y: 2, piece: nil },
          { id: 'e8', x: 4, y: 2, piece: nil },
          { id: 'f8', x: 5, y: 2, piece: nil },
          { id: 'g8', x: 6, y: 2, piece: nil },
          { id: 'h8', x: 7, y: 2, piece: { id: 11, player_number: 2, type: 'pao' } },
          { id: 'i8', x: 8, y: 2, piece: nil },

          { id: 'a7', x: 0, y: 3, piece: { id: 12, player_number: 2, type: 'zu' } },
          { id: 'b7', x: 1, y: 3, piece: nil },
          { id: 'c7', x: 2, y: 3, piece: { id: 13, player_number: 2, type: 'zu' } },
          { id: 'd7', x: 3, y: 3, piece: nil },
          { id: 'e7', x: 4, y: 3, piece: { id: 14, player_number: 2, type: 'zu' } },
          { id: 'f7', x: 5, y: 3, piece: nil },
          { id: 'g7', x: 6, y: 3, piece: { id: 15, player_number: 2, type: 'zu' } },
          { id: 'h7', x: 7, y: 3, piece: nil },
          { id: 'i7', x: 8, y: 3, piece: { id: 16, player_number: 2, type: 'zu' } },

          { id: 'a6', x: 0, y: 4, piece: nil },
          { id: 'b6', x: 1, y: 4, piece: nil },
          { id: 'c6', x: 2, y: 4, piece: nil },
          { id: 'd6', x: 3, y: 4, piece: nil },
          { id: 'e6', x: 4, y: 4, piece: nil },
          { id: 'f6', x: 5, y: 4, piece: nil },
          { id: 'g6', x: 6, y: 4, piece: nil },
          { id: 'h6', x: 7, y: 4, piece: nil },
          { id: 'i6', x: 8, y: 4, piece: nil },

          { id: 'a5', x: 0, y: 5, piece: nil },
          { id: 'b5', x: 1, y: 5, piece: nil },
          { id: 'c5', x: 2, y: 5, piece: nil },
          { id: 'd5', x: 3, y: 5, piece: nil },
          { id: 'e5', x: 4, y: 5, piece: nil },
          { id: 'f5', x: 5, y: 5, piece: nil },
          { id: 'g5', x: 6, y: 5, piece: nil },
          { id: 'h5', x: 7, y: 5, piece: nil },
          { id: 'i5', x: 8, y: 5, piece: nil },

          { id: 'a4', x: 0, y: 6, piece: { id: 17, player_number: 1, type: 'zu' } },
          { id: 'b4', x: 1, y: 6, piece: nil },
          { id: 'c4', x: 2, y: 6, piece: { id: 17, player_number: 1, type: 'zu' } },
          { id: 'd4', x: 3, y: 6, piece: nil },
          { id: 'e4', x: 4, y: 6, piece: { id: 17, player_number: 1, type: 'zu' } },
          { id: 'f4', x: 5, y: 6, piece: nil },
          { id: 'g4', x: 6, y: 6, piece: { id: 17, player_number: 1, type: 'zu' } },
          { id: 'h4', x: 7, y: 6, piece: nil },
          { id: 'i4', x: 8, y: 6, piece: { id: 17, player_number: 1, type: 'zu' } },

          { id: 'a3', x: 0, y: 7, piece: nil },
          { id: 'b3', x: 1, y: 7, piece: { id: 18, player_number: 1, type: 'pao' } },
          { id: 'c3', x: 2, y: 7, piece: nil },
          { id: 'd3', x: 3, y: 7, piece: nil },
          { id: 'e3', x: 4, y: 7, piece: nil },
          { id: 'f3', x: 5, y: 7, piece: nil },
          { id: 'g3', x: 6, y: 7, piece: nil },
          { id: 'h3', x: 7, y: 7, piece: { id: 19, player_number: 1, type: 'pao' } },
          { id: 'i3', x: 8, y: 7, piece: nil },

          { id: 'a2', x: 0, y: 8, piece: nil },
          { id: 'b2', x: 1, y: 8, piece: nil },
          { id: 'c2', x: 2, y: 8, piece: nil },
          { id: 'd2', x: 3, y: 8, piece: nil },
          { id: 'e2', x: 4, y: 8, piece: nil },
          { id: 'f2', x: 5, y: 8, piece: nil },
          { id: 'g2', x: 6, y: 8, piece: nil },
          { id: 'h2', x: 7, y: 8, piece: nil },
          { id: 'i2', x: 8, y: 8, piece: nil },

          { id: 'a1', x: 0, y: 9, piece: { id: 20, player_number: 1, type: 'ju' } },
          { id: 'b1', x: 1, y: 9, piece: { id: 21, player_number: 1, type: 'ma' } },
          { id: 'c1', x: 2, y: 9, piece: { id: 22, player_number: 1, type: 'xiang' } },
          { id: 'd1', x: 3, y: 9, piece: { id: 23, player_number: 1, type: 'shi' } },
          { id: 'e1', x: 4, y: 9, piece: { id: 24, player_number: 1, type: 'jiang' } },
          { id: 'f1', x: 5, y: 9, piece: { id: 25, player_number: 1, type: 'shi' } },
          { id: 'g1', x: 6, y: 9, piece: { id: 26, player_number: 1, type: 'xiang' } },
          { id: 'h1', x: 7, y: 9, piece: { id: 27, player_number: 1, type: 'ma' } },
          { id: 'i1', x: 8, y: 9, piece: { id: 28, player_number: 1, type: 'ju' } }
        ]
      )
    end

    # serializes the game state as ahash
    #
    # @return [Hash]
    def as_json
      {
        current_player_number: current_player_number,
        squares: squares.as_json,
      }
    end

    # deep clone of the game state
    #
    # @return [GameState]
    def clone
      self.class.new(**as_json)
    end

    # Moves a piece owned by the player, from one square, to another.
    #
    # It has an option to promote the moving piece.
    # It moves the piece and returns true if the move is valid and it's the player's turn.
    # It returns false otherwise.
    #
    # ==== Example:
    #   # Moves a piece from a square to perform a move
    #   game_state.move(1, '77', '78')
    #
    # @param [Fixnum] player_number
    #   the player number, 1 or 2.
    #
    # @param [String] from_id
    #   the id of the from square
    #
    # @param [String] to_id
    #   the id of the to square
    #
    # @return [Boolean]
    def move(player_number, from_id, to_id)
      @errors = []

      from = squares.find_by_id(from_id)
      to = squares.find_by_id(to_id)

      if current_player_number != player_number
        @errors.push JustXiangqi::NotPlayersTurnError.new
      elsif from.unoccupied?
        @errors.push JustXiangqi::NoPieceError.new
      elsif to.nil?
        @errors.push JustXiangqi::OffBoardError.new
      elsif from.piece.can_move?(from, to, self)

        duplicate = self.clone
        duplicate.perform_complete_move(player_number, from_id, to_id)

        if duplicate.in_check?(current_player_number)
          @errors.push JustXiangqi::MovedIntoCheckError.new
        else
          perform_complete_move(player_number, from_id, to_id)
        end
      else
        @errors.push JustXiangqi::InvalidMoveError.new
      end

      @errors.empty?
    end

    # The player number of the winner. It returns nil if there is no winner.
    #
    # @return [Fixnum,NilClass]
    def winner
      case
      when in_checkmate?(1)
        2
      when in_checkmate?(2)
        1
      else
        nil
      end
    end

    # Moves a piece owned by the player, from one square, to another, with the option to promote.
    #
    # It moves the piece and returns true if the move is valid and it's the player's turn.
    # It returns false otherwise.
    def perform_complete_move(player_number, from_id, to_id)
      from = squares.find_by_id(from_id)
      to = squares.find_by_id(to_id)

      captured = to.occupied? ? to : nil

      @last_change = { type: 'move', data: { player_number: player_number, from: from_id, to: to_id } }

      perform_move(player_number, from, to, captured)

      pass_turn
    end

    def in_check?(player_number)
      jiang_square = squares.find_jiang_for_player(player_number)
      threatened_by = squares.threatened_by(opposing_player_number(player_number), self)
      threatened_by.include?(jiang_square)
    end

    def in_checkmate?(player_number)
      (in_check?(player_number) || non_jiang_pieces_cannot_move?(player_number)) && jiang_cannot_move?(player_number)
    end

    private

    def non_jiang_pieces_cannot_move?(player_number)
      squares.occupied_by_player(player_number).excluding_piece(JustXiangqi::Jiang).all? { |s| s.piece.destinations(s, self).empty? }
    end

    def jiang_cannot_move?(player_number)
      jiang_square = squares.find_jiang_for_player(player_number)
      destinations = jiang_square.piece.destinations(jiang_square, self)
      destinations.all? do |destination|
        duplicate = self.clone
        duplicate.perform_complete_move(player_number, jiang_square.id, destination.id)
        duplicate.in_check?(player_number)
      end
    end

    def pass_turn
      @current_player_number = opposing_player_number
    end

    def opposing_player_number(player_number = nil)
      if player_number
        other_player_number(player_number)
      else
        other_player_number(@current_player_number)
      end
    end

    def other_player_number(player_number)
      (player_number == 1) ? 2 : 1
    end

    def perform_move(player_number, from, to, captured)
      if captured
        captured.piece = nil
      end
      to.piece = from.piece
      from.piece = nil
    end
  end
end

