require 'minitest/autorun'
require 'minitest/spec'
require 'just_xiangqi/pieces/zu'
require 'just_xiangqi/piece_factory'

describe JustXiangqi::PieceFactory do
  describe '.build' do
    describe 'given a hash' do
      it 'returns a piece with attributes specified in the hash' do
        piece = { id: 1, player_number: 2, type: 'zu' }
        factory = JustXiangqi::PieceFactory.new(piece)
        result = factory.build

        assert_instance_of JustXiangqi::Zu, result
        assert_equal 1, result.id
        assert_equal 2, result.player_number
      end
    end
    
    describe 'given a piece' do
      it 'returns the piece passed in' do
        piece = JustXiangqi::Zu.new(id: 1, player_number: 2)
        factory = JustXiangqi::PieceFactory.new(piece)
        assert_equal piece, factory.build
      end
    end

    describe 'given nil' do
      it 'returns nil' do
        piece = nil
        factory = JustXiangqi::PieceFactory.new(piece)
        assert_nil factory.build
      end
    end

    describe 'given unexpected input' do
      it 'raises error' do
        piece = 'zu'
        factory = JustXiangqi::PieceFactory.new(piece)
        assert_raises(ArgumentError) do
          factory.build
        end
      end
    end
  end
end
