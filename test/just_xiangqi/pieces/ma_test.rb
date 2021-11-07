require 'minitest/autorun'
require 'minitest/spec'
require 'just_xiangqi/pieces/ma'
require 'just_xiangqi/square'
require 'just_xiangqi/square_set'
require 'just_xiangqi/game_state'

describe JustXiangqi::Ma do
  describe '#destinations' do
    it 'returns the squares in an l-shape' do
      ma = JustXiangqi::Ma.new(id: 1, player_number: 1)
      from = JustXiangqi::Square.new(id: 'b1', x: 1, y: 9, piece: ma)
      between = JustXiangqi::Square.new(id: 'b2', x: 1, y: 8, piece: nil)
      to = JustXiangqi::Square.new(id: 'a3', x: 0, y: 7, piece: nil)

      squares = JustXiangqi::SquareSet.new(squares: [from, between, to])

      game_state = JustXiangqi::GameState.new(current_player_number: 1, squares: squares)

      result = ma.destinations(from, game_state)

      assert_includes(result, to)
    end

    it 'returns squares that are occupied by opponent' do
      ma = JustXiangqi::Ma.new(id: 1, player_number: 1)
      opponent = JustXiangqi::Zu.new(id: 1, player_number: 2)
      from = JustXiangqi::Square.new(id: 'b1', x: 1, y: 9, piece: ma)
      between = JustXiangqi::Square.new(id: 'b2', x: 1, y: 8, piece: nil)
      to = JustXiangqi::Square.new(id: 'a3', x: 0, y: 7, piece: opponent)

      squares = JustXiangqi::SquareSet.new(squares: [from, between, to])

      game_state = JustXiangqi::GameState.new(current_player_number: 1, squares: squares)

      result = ma.destinations(from, game_state)

      assert_includes(result, to)
    end

    it 'does not return squares that are blocked' do
      ma = JustXiangqi::Ma.new(id: 1, player_number: 1)
      friendly = JustXiangqi::Zu.new(id: 1, player_number: 1)
      from = JustXiangqi::Square.new(id: 'b1', x: 1, y: 9, piece: ma)
      between = JustXiangqi::Square.new(id: 'b2', x: 1, y: 8, piece: nil)
      to = JustXiangqi::Square.new(id: 'a3', x: 0, y: 7, piece: friendly)

      squares = JustXiangqi::SquareSet.new(squares: [from, between, to])

      game_state = JustXiangqi::GameState.new(current_player_number: 1, squares: squares)

      result = ma.destinations(from, game_state)

      refute_includes(result, to)
    end

    it 'does not return squares that are blocked in between' do
      ma = JustXiangqi::Ma.new(id: 1, player_number: 1)
      blocker = JustXiangqi::Zu.new(id: 2, player_number: 2)
      from = JustXiangqi::Square.new(id: 'b1', x: 1, y: 9, piece: ma)
      between = JustXiangqi::Square.new(id: 'b2', x: 1, y: 8, piece: blocker)
      to = JustXiangqi::Square.new(id: 'a3', x: 0, y: 7, piece: nil)

      squares = JustXiangqi::SquareSet.new(squares: [from, between, to])

      game_state = JustXiangqi::GameState.new(current_player_number: 1, squares: squares)

      result = ma.destinations(from, game_state)

      refute_includes(result, to)
    end
  end
end
