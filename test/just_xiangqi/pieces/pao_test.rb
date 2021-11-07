require 'minitest/autorun'
require 'minitest/spec'
require 'just_xiangqi/pieces/pao'
require 'just_xiangqi/square'
require 'just_xiangqi/square_set'
require 'just_xiangqi/game_state'

describe JustXiangqi::Zu do
  describe '#destinations' do
    it 'returns orthogonal unblocked squares for moving' do
      pao = JustXiangqi::Pao.new(id: 18, player_number: 1)
      opposing = JustXiangqi::Zu.new(id: 1, player_number: 2)
      from = JustXiangqi::Square.new(id: 'b3', x: 1, y: 7, piece: pao)
      front = JustXiangqi::Square.new(id: 'b4', x: 1, y: 6, piece: nil)
      side = JustXiangqi::Square.new(id: 'c3', x: 2, y: 7, piece: nil)
      back = JustXiangqi::Square.new(id: 'b2', x: 1, y: 8, piece: nil)
      diagonal = JustXiangqi::Square.new(id: 'c4', x: 2, y: 6, piece: nil)
      blocked = JustXiangqi::Square.new(id: 'b5', x: 1, y: 5, piece: opposing)

      squares = JustXiangqi::SquareSet.new(squares: [from, front, diagonal, side, back, blocked]) 

      game_state = JustXiangqi::GameState.new(current_player_number: 1, squares: squares)

      result = pao.destinations(from, game_state)

      assert_includes(result, front)
      refute_includes(result, diagonal)
      assert_includes(result, back)
      assert_includes(result, side)
      refute_includes(result, blocked)
    end

    it 'returns a square behind an enemy piece for capturing' do
      pao = JustXiangqi::Pao.new(id: 18, player_number: 1)
      opposing = JustXiangqi::Zu.new(id: 1, player_number: 2)
      from = JustXiangqi::Square.new(id: 'b3', x: 1, y: 7, piece: pao)
      front = JustXiangqi::Square.new(id: 'b4', x: 1, y: 6, piece: nil)
      side = JustXiangqi::Square.new(id: 'c3', x: 2, y: 7, piece: nil)
      back = JustXiangqi::Square.new(id: 'b2', x: 1, y: 8, piece: nil)
      diagonal = JustXiangqi::Square.new(id: 'c4', x: 2, y: 6, piece: nil)
      blocked = JustXiangqi::Square.new(id: 'b5', x: 1, y: 5, piece: opposing)
      capture = JustXiangqi::Square.new(id: 'b6', x: 1, y: 4, piece: nil)

      squares = JustXiangqi::SquareSet.new(squares: [from, front, diagonal, side, back, blocked, capture]) 

      game_state = JustXiangqi::GameState.new(current_player_number: 1, squares: squares)

      result = pao.destinations(from, game_state)

      assert_includes(result, front)
      refute_includes(result, diagonal)
      assert_includes(result, back)
      assert_includes(result, side)
      refute_includes(result, blocked)
      assert_includes(result, capture)
    end
  end
end
