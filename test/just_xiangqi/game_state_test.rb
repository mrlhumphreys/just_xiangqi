require 'minitest/autorun'
require 'minitest/spec'
require 'just_xiangqi/game_state'

describe JustXiangqi::GameState do
  describe '#initialize' do
    describe 'given a square set for squares' do
      it 'sets the square set' do
        square_set = JustXiangqi::SquareSet.new(squares: [
          { id: 'e6', x: 4, y: 4, piece: nil },
          { id: 'f6', x: 5, y: 4, piece: nil }
        ])
        game_state = JustXiangqi::GameState.new(current_player_number: 1, squares: square_set)

        assert_equal square_set, game_state.squares
      end
    end

    describe 'given an array for squares' do
      it 'sets the square set' do
        squares = [
          { id: 'e6', x: 4, y: 4, piece: nil },
          { id: 'f6', x: 5, y: 4, piece: nil }
        ]
        game_state = JustXiangqi::GameState.new(current_player_number: 1, squares: squares)

        assert_instance_of JustXiangqi::SquareSet, game_state.squares
        assert_equal 2, game_state.squares.size
      end
    end
  end

  describe '.default' do
    it 'returns the right sized board' do
      game_state = JustXiangqi::GameState.default
      assert_equal 90, game_state.squares.size
      assert_equal 32, game_state.squares.select(&:piece).size
    end
  end

  describe '#as_json' do
    it 'returns a serialized representation of the game state' do
      game_state = JustXiangqi::GameState.default
      expected = {
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
      }

      result = game_state.as_json

      assert_equal expected, result
    end
  end

  describe '.clone' do
    it 'returns a deep clone of the game state' do
      game_state = JustXiangqi::GameState.default
      result = game_state.clone

      refute_equal game_state.object_id, result.object_id
      assert_equal game_state.as_json, result.as_json
    end
  end

  describe '#move' do
    describe 'not players turn' do
      it 'should not change the board' do
        game_state = JustXiangqi::GameState.default
        from_id = 'i7'
        to_id = 'i6'

        result = game_state.move(2, from_id, to_id)

        from = game_state.squares.find_by_id(from_id)
        to = game_state.squares.find_by_id(to_id)

        refute result
        assert game_state.errors.any? { |e| e.is_a?(JustXiangqi::NotPlayersTurnError) }
        refute_nil from.piece
        assert_nil to.piece
      end
    end

    describe 'no piece to move' do
      it 'should not change the board' do
        game_state = JustXiangqi::GameState.default
        from_id = 'a6'
        to_id = 'b6'

        result = game_state.move(1, from_id, to_id)

        from = game_state.squares.find_by_id(from_id)
        to = game_state.squares.find_by_id(to_id)

        refute result
        assert game_state.errors.any? { |e| e.is_a?(JustXiangqi::NoPieceError) }
        assert_nil from.piece
        assert_nil to.piece
      end
    end

    describe 'moving to off the board' do
      it 'should not change the board' do
        game_state = JustXiangqi::GameState.default
        from_id = 'i4'
        to_id = 'j4'

        result = game_state.move(1, from_id, to_id)

        from = game_state.squares.find_by_id(from_id)
        to = game_state.squares.find_by_id(to_id)

        refute result
        assert game_state.errors.any? { |e| e.is_a?(JustXiangqi::OffBoardError) }
        refute_nil from.piece
        assert_nil to
      end
    end

    describe 'piece cannot move' do
      it 'should not change the board' do
        game_state = JustXiangqi::GameState.default
        from_id = 'i4'
        to_id = 'h4'

        result = game_state.move(1, from_id, to_id)

        from = game_state.squares.find_by_id(from_id)
        to = game_state.squares.find_by_id(to_id)

        refute result
        assert game_state.errors.any? { |e| e.is_a?(JustXiangqi::InvalidMoveError) }
        refute_nil from.piece
        assert_nil to.piece
      end
    end

    describe 'move results in check' do
      it 'should not change the board' do
        game_state = JustXiangqi::GameState.new(
          current_player_number: 1,
          squares: [
            { id: 'a10', x: 0, y: 0, piece: { id: 1, player_number: 2, type: 'jiang' } },
            { id: 'b10', x: 1, y: 0, piece: { id: 2, player_number: 2, type: 'ju' } },
            { id: 'c10', x: 2, y: 0, piece: { id: 3, player_number: 1, type: 'ju' } },
            { id: 'd10', x: 3, y: 0, piece: { id: 4, player_number: 1, type: 'jiang' } },
            { id: 'c9', x: 2, y: 1, piece: nil }
          ]
        )
        from_id = 'c10'
        to_id = 'c9'

        result = game_state.move(1, from_id, to_id)

        from = game_state.squares.find_by_id(from_id)
        to = game_state.squares.find_by_id(to_id)

        refute result
        assert game_state.errors.any? { |e| e.is_a?(JustXiangqi::MovedIntoCheckError) }
        refute_nil from.piece
        assert_nil to.piece
      end
    end

    describe 'move is valid' do
      it 'should change the board' do
        game_state = JustXiangqi::GameState.default
        from_id = 'a4'
        to_id = 'a5'

        result = game_state.move(1, from_id, to_id)

        from = game_state.squares.find_by_id(from_id)
        to = game_state.squares.find_by_id(to_id)
          
        assert result
        assert game_state.errors.empty?
        assert_nil from.piece
        refute_nil to.piece
      end
    end

    describe 'valid capture' do
      it 'should change the board' do
        game_state = JustXiangqi::GameState.new(
          current_player_number: 1,
          squares: [
            { id: 'a10', x: 0, y: 0, piece: { id: 1, player_number: 2, type: 'jiang' } },
            { id: 'b10', x: 1, y: 0, piece: { id: 2, player_number: 2, type: 'ju' } },
            { id: 'c10', x: 2, y: 0, piece: nil },
            { id: 'd10', x: 3, y: 0, piece: { id: 4, player_number: 1, type: 'jiang' } },
            { id: 'b9', x: 1, y: 1, piece: { id: 1, player_number: 1, type: 'zu' } }
          ]
        )
        from_id = 'b9'
        to_id = 'b10'

        result = game_state.move(1, from_id, to_id)

        from = game_state.squares.find_by_id(from_id)
        to = game_state.squares.find_by_id(to_id)

        assert result
        assert game_state.errors.empty?
        assert_nil from.piece
        refute_nil to.piece
        assert_instance_of JustXiangqi::Zu, to.piece
      end
    end
  end

  describe '#winner' do
    describe 'player 1 in checkmate' do
      it 'returns 2' do
        game_state = JustXiangqi::GameState.new(
          current_player_number: 1,
          squares: [
            { id: 'a10', x: 0, y: 0, piece: { id: 1, player_number: 2, type: 'jiang' } },
            { id: 'b10', x: 1, y: 0, piece: { id: 2, player_number: 2, type: 'ju' } },
            { id: 'c10', x: 2, y: 0, piece: nil },
            { id: 'd10', x: 3, y: 0, piece: { id: 4, player_number: 1, type: 'jiang' } },
            { id: 'd9', x: 3, y: 1, piece: { id: 5, player_number: 1, type: 'zu' } }
          ]
        )

        assert_equal 2, game_state.winner
      end
    end

    describe 'player 2 in checkmate' do
      it 'returns 1' do
        game_state = JustXiangqi::GameState.new(
          current_player_number: 2,
          squares: [
            { id: 'a10', x: 0, y: 0, piece: { id: 1, player_number: 1, type: 'jiang' } },
            { id: 'b10', x: 1, y: 0, piece: { id: 2, player_number: 1, type: 'ju' } },
            { id: 'c10', x: 2, y: 0, piece: nil },
            { id: 'd10', x: 3, y: 0, piece: { id: 4, player_number: 2, type: 'jiang' } },
            { id: 'd9', x: 3, y: 1, piece: { id: 5, player_number: 2, type: 'zu' } }
          ]
        )

        assert_equal 1, game_state.winner
      end
    end

    describe 'neither player in checkmate' do
      it 'returns null' do
        game_state = JustXiangqi::GameState.default
        assert_nil game_state.winner
      end
    end
  end

  describe '#perform_complete_move' do
    describe 'when normal' do
      it 'changes the board' do
        game_state = JustXiangqi::GameState.default
        from_id = 'a4'
        to_id = 'a5'

        result = game_state.perform_complete_move(1, from_id, to_id)

        from = game_state.squares.find_by_id(from_id)
        to = game_state.squares.find_by_id(to_id)

        assert result
        assert_nil from.piece
        refute_nil to.piece
      end
    end

    describe 'when capturing' do
      it 'changes the board' do
        game_state = JustXiangqi::GameState.new(
          current_player_number: 1,
          squares: [
            { id: 'a10', x: 0, y: 0, piece: { id: 1, player_number: 2, type: 'jiang' } },
            { id: 'b10', x: 1, y: 0, piece: { id: 2, player_number: 2, type: 'ju' } },
            { id: 'c10', x: 2, y: 0, piece: nil },
            { id: 'd10', x: 3, y: 0, piece: { id: 4, player_number: 1, type: 'jiang' } },
            { id: 'b9', x: 1, y: 1, piece: { id: 1, player_number: 1, type: 'zu' } }
          ]
        )
        from_id = 'b9'
        to_id = 'b10'

        result = game_state.perform_complete_move(1, from_id, to_id)

        from = game_state.squares.find_by_id(from_id)
        to = game_state.squares.find_by_id(to_id)

        assert result
        assert_nil from.piece
        refute_nil to.piece
        assert_instance_of JustXiangqi::Zu, to.piece
      end
    end
  end

  describe '#in_check?' do
    describe 'jiang is threatened' do
      it 'must be in check' do
        game_state = JustXiangqi::GameState.new(
          current_player_number: 1,
          squares: [
            { id: 'a10', x: 0, y: 0, piece: { id: 1, player_number: 2, type: 'jiang' } },
            { id: 'b10', x: 1, y: 0, piece: { id: 2, player_number: 2, type: 'ju' } },
            { id: 'c10', x: 2, y: 0, piece: nil },
            { id: 'd10', x: 3, y: 0, piece: { id: 4, player_number: 1, type: 'jiang' } },
            { id: 'd9', x: 3, y: 1, piece: nil }
          ]
        )

        assert game_state.in_check?(1)
      end
    end

    describe 'jiang is not threatened' do
      it 'must not be in check' do
        game_state = JustXiangqi::GameState.new(
          current_player_number: 1,
          squares: [
            { id: 'a10', x: 0, y: 0, piece: { id: 1, player_number: 2, type: 'jiang' } },
            { id: 'b10', x: 1, y: 0, piece: nil },
            { id: 'c10', x: 2, y: 0, piece: nil },
            { id: 'd10', x: 3, y: 0, piece: { id: 4, player_number: 1, type: 'jiang' } },

            { id: 'd9', x: 3, y: 1, piece: nil }
          ]
        )

        refute game_state.in_check?(1)
      end
    end
  end

  describe '#in_checkmate?' do
    describe 'when in check' do
      describe 'and jiang cannot move' do
        it 'returns true' do
          game_state = JustXiangqi::GameState.new(
            current_player_number: 1,
            squares: [
              { id: 'a10', x: 0, y: 0, piece: { id: 1, player_number: 2, type: 'jiang' } },
              { id: 'b10', x: 1, y: 0, piece: { id: 2, player_number: 2, type: 'ju' } },
              { id: 'c10', x: 2, y: 0, piece: nil },
              { id: 'd10', x: 3, y: 0, piece: { id: 4, player_number: 1, type: 'jiang' } },
              { id: 'd9', x: 3, y: 1, piece: { id: 5, player_number: 1, type: 'zu' } }
            ]
          )

          assert game_state.in_checkmate?(1)
        end
      end

      describe 'and jiang can move' do
        it 'returns false' do
          game_state = JustXiangqi::GameState.new(
            current_player_number: 1,
            squares: [
              { id: 'a10', x: 0, y: 0, piece: { id: 1, player_number: 2, type: 'jiang' } },
              { id: 'b10', x: 1, y: 0, piece: { id: 2, player_number: 2, type: 'ju' } },
              { id: 'c10', x: 2, y: 0, piece: nil },
              { id: 'd10', x: 3, y: 0, piece: { id: 4, player_number: 1, type: 'jiang' } },

              { id: 'd9', x: 3, y: 1, piece: nil }
            ]
          )

          refute game_state.in_checkmate?(1)
        end
      end
    end

    describe 'not in check' do
      describe 'and non jiang pieces cannot move' do
        describe 'and jiang cannot move' do
          it 'returns true' do
            game_state = JustXiangqi::GameState.new(
              current_player_number: 1,
              squares: [
                { id: 'a10', x: 0, y: 0, piece: { id: 1, player_number: 2, type: 'jiang' } },
                { id: 'b10', x: 1, y: 0, piece: { id: 2, player_number: 2, type: 'ju' } },
                { id: 'c10', x: 2, y: 0, piece: { id: 3, player_number: 1, type: 'pao' } },
                { id: 'd10', x: 3, y: 0, piece: { id: 4, player_number: 1, type: 'jiang' } },
                { id: 'd9', x: 3, y: 1, piece: { id: 5, player_number: 1, type: 'zu' } }
              ]
            )

            assert game_state.in_checkmate?(1)
          end
        end

        describe 'and jiang can move' do
          it 'returns false' do
            game_state = JustXiangqi::GameState.new(
              current_player_number: 1,
              squares: [
                { id: 'a10', x: 0, y: 0, piece: { id: 1, player_number: 2, type: 'jiang' } },
                { id: 'b10', x: 1, y: 0, piece: { id: 2, player_number: 2, type: 'ju' } },
                { id: 'c10', x: 2, y: 0, piece: { id: 3, player_number: 1, type: 'zu' } },
                { id: 'd10', x: 3, y: 0, piece: { id: 4, player_number: 1, type: 'jiang' } },

                { id: 'd9', x: 3, y: 1, piece: nil }
              ]
            )

            refute game_state.in_checkmate?(1)
          end
        end
      end

      describe 'and non jiang pieces can move' do
        it 'returns false' do
          game_state = JustXiangqi::GameState.new(
            current_player_number: 1,
            squares: [
              { id: 'a10', x: 0, y: 0, piece: { id: 1, player_number: 2, type: 'jiang' } },
              { id: 'b10', x: 1, y: 0, piece: { id: 2, player_number: 2, type: 'ju' } },
              { id: 'c10', x: 2, y: 0, piece: { id: 3, player_number: 1, type: 'ju' } },
              { id: 'd10', x: 3, y: 0, piece: { id: 4, player_number: 1, type: 'jiang' } },
              { id: 'd9', x: 3, y: 1, piece: { id: 5, player_number: 1, type: 'zu' } }
            ]
          )

          refute game_state.in_checkmate?(1)
        end
      end
    end
  end
end
