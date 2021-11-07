require 'minitest/autorun'
require 'minitest/spec'
require 'just_xiangqi/pieces/xiang'
require 'just_xiangqi/square'
require 'just_xiangqi/square_set'
require 'just_xiangqi/game_state'

describe JustXiangqi::Xiang do
  describe '#destinations' do
    it 'returns the squares it can move to if unoccupied' do
      xiang = JustXiangqi::Xiang.new(id: 1, player_number: 1)
      from = JustXiangqi::Square.new(id: 'c1', x: 2, y: 9, piece: xiang)
      orthogonal = JustXiangqi::Square.new(id: 'c3', x: 2, y: 7, piece: nil)
      close = JustXiangqi::Square.new(id: 'b2', x: 1, y: 8, piece: nil)
      diagonal = JustXiangqi::Square.new(id: 'a3', x: 0, y: 7, piece: nil)
      across_river = JustXiangqi::Square.new(id: 'g5', x: 6, y: 5, piece: nil)

      squares = JustXiangqi::SquareSet.new(squares: [from, orthogonal, close, diagonal, across_river])

      game_state = JustXiangqi::GameState.new(current_player_number: 1, squares: squares)

      result = xiang.destinations(from, game_state)

      refute_includes(result, orthogonal)
      refute_includes(result, close)
      assert_includes(result, diagonal)
      refute_includes(result, across_river)
    end

    it 'returns the squares it can move to if occupied by opponent' do
      xiang = JustXiangqi::Xiang.new(id: 1, player_number: 1)
      opponent = JustXiangqi::Zu.new(id: 1, player_number: 2)
      from = JustXiangqi::Square.new(id: 'c1', x: 2, y: 9, piece: xiang)
      orthogonal = JustXiangqi::Square.new(id: 'c3', x: 2, y: 7, piece: nil)
      close = JustXiangqi::Square.new(id: 'b2', x: 1, y: 8, piece: nil)
      diagonal = JustXiangqi::Square.new(id: 'a3', x: 0, y: 7, piece: opponent)
      across_river = JustXiangqi::Square.new(id: 'g5', x: 6, y: 5, piece: nil)

      squares = JustXiangqi::SquareSet.new(squares: [from, orthogonal, close, diagonal, across_river])

      game_state = JustXiangqi::GameState.new(current_player_number: 1, squares: squares)

      result = xiang.destinations(from, game_state)

      refute_includes(result, orthogonal)
      refute_includes(result, close)
      assert_includes(result, diagonal)
      refute_includes(result, across_river)
    end

    it 'does not return the squares that are blocked' do
      xiang = JustXiangqi::Xiang.new(id: 1, player_number: 1)
      friendly = JustXiangqi::Zu.new(id: 1, player_number: 1)
      from = JustXiangqi::Square.new(id: 'c1', x: 2, y: 9, piece: xiang)
      orthogonal = JustXiangqi::Square.new(id: 'c3', x: 2, y: 7, piece: nil)
      close = JustXiangqi::Square.new(id: 'b2', x: 1, y: 8, piece: nil)
      diagonal = JustXiangqi::Square.new(id: 'a3', x: 0, y: 7, piece: friendly)
      across_river = JustXiangqi::Square.new(id: 'g5', x: 6, y: 5, piece: nil)

      squares = JustXiangqi::SquareSet.new(squares: [from, orthogonal, close, diagonal, across_river])

      game_state = JustXiangqi::GameState.new(current_player_number: 1, squares: squares)

      result = xiang.destinations(from, game_state)

      refute_includes(result, orthogonal)
      refute_includes(result, close)
      refute_includes(result, diagonal)
      refute_includes(result, across_river)
    end
  end
end
