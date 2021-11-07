require 'minitest/autorun'
require 'minitest/spec'
require 'just_xiangqi/square_set'

describe JustXiangqi::SquareSet do
  describe '#initialize' do
    describe 'when all hashes' do
      it 'returns the square set' do
        square_set = JustXiangqi::SquareSet.new(squares: [
          { id: 'e6', x: 4, y: 4, piece: nil },
          { id: 'e7', x: 4, y: 3, piece: nil }
        ])

        first_square = square_set.squares[0]

        assert_instance_of JustXiangqi::SquareSet, square_set
        assert_equal 2, square_set.squares.size
        assert_instance_of JustXiangqi::Square, first_square
      end
    end

    describe 'when all squares' do
      it 'returns the square set' do
        square_set = JustXiangqi::SquareSet.new(squares: [
          JustXiangqi::Square.new(id: 'e6', x: 4, y: 4, piece: nil),
          JustXiangqi::Square.new(id: 'e7', x: 4, y: 3, piece: nil)
        ])

        first_square = square_set.squares[0]

        assert_instance_of JustXiangqi::SquareSet, square_set
        assert_equal 2, square_set.squares.size
        assert_instance_of JustXiangqi::Square, first_square
      end
    end

    describe 'when mismatched' do
      it 'raises an error' do
        assert_raises(ArgumentError) do
          JustXiangqi::SquareSet.new(squares: [
            { id: 'e6', x: 4, y: 4, piece: nil },
            JustXiangqi::Square.new(id: 'e7', x: 4, y: 3, piece: nil)
          ])
        end
      end
    end

    describe 'when not an array' do
      it 'raises an error' do
        assert_raises(ArgumentError) do
          JustXiangqi::SquareSet.new(squares: 'string')
        end
      end
    end
  end

  describe '#find_jiang_for_player' do
    it 'returns the jiang for that player' do
      square_set = JustXiangqi::SquareSet.new(squares: [
        { id: 'e6', x: 4, y: 4, piece: nil },
        { id: 'e7', x: 4, y: 3, piece: { id: 1, player_number: 1, type: 'jiang' } }
      ])

      result = square_set.find_jiang_for_player(1)

      assert_instance_of JustXiangqi::Jiang, result.piece
      assert_equal 1, result.piece.player_number
    end
  end

  describe '#threatened_by' do
    it 'returns squares that are threatened by the player' do
      origin = JustXiangqi::Square.new(id: 'e7', x: 4, y: 3, piece: { id: 1, player_number: 2, type: 'zu' })
      threat = JustXiangqi::Square.new(id: 'e6', x: 4, y: 4, piece: nil)
      not_threat = JustXiangqi::Square.new(id: 'e5', x: 4, y: 5, piece: nil)
      square_set = JustXiangqi::SquareSet.new(squares: [ origin, threat, not_threat ])
      game_state = JustXiangqi::GameState.new(current_player_number: 1, squares: square_set)

      result = square_set.threatened_by(2, game_state)

      assert_includes result, threat
      refute_includes result, not_threat
    end
  end
end
