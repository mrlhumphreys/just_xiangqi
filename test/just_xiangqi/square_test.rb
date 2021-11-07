require 'minitest/autorun'
require 'minitest/spec'
require 'just_xiangqi/square'

describe JustXiangqi::Square do
  describe '#initialize' do
    it 'initializes the attributes' do
      square = JustXiangqi::Square.new(id: '55', x: 4, y: 4, piece: { id: 1, player_number: 2, type: 'zu' })
      assert_instance_of JustXiangqi::Zu, square.piece
    end
  end
end
