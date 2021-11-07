require 'minitest/autorun'
require 'minitest/spec'
require 'just_xiangqi/pieces/jiang'
require 'just_xiangqi/square'
require 'just_xiangqi/square_set'
require 'just_xiangqi/game_state'

describe JustXiangqi::Jiang do
  describe '#destinations' do
    it 'returns the squares it can move to if unoccupied' do
      jiang = JustXiangqi::Jiang.new(id: 1, player_number: 1)
      from = JustXiangqi::Square.new(id: 'd1', x: 3, y: 9, piece: jiang)
      orthogonal = JustXiangqi::Square.new(id: 'd2', x: 3, y: 8, piece: nil)
      diagonal = JustXiangqi::Square.new(id: 'e2', x: 4, y: 8, piece: nil)
      outside_palace = JustXiangqi::Square.new(id: 'c1', x: 2, y: 9, piece: nil)

      squares = JustXiangqi::SquareSet.new(squares: [from, orthogonal, diagonal, outside_palace])

      game_state = JustXiangqi::GameState.new(current_player_number: 1, squares: squares)

      result = jiang.destinations(from, game_state)

      assert_includes(result, orthogonal)
      refute_includes(result, diagonal)
      refute_includes(result, outside_palace)
    end

    it 'returns the squares it can move to if occupied by opponent' do
      jiang = JustXiangqi::Jiang.new(id: 1, player_number: 1)
      opponent = JustXiangqi::Zu.new(id: 2, player_number: 2)
      from = JustXiangqi::Square.new(id: 'd1', x: 3, y: 9, piece: jiang)
      orthogonal = JustXiangqi::Square.new(id: 'd2', x: 3, y: 8, piece: opponent)
      diagonal = JustXiangqi::Square.new(id: 'e2', x: 4, y: 8, piece: nil)
      outside_palace = JustXiangqi::Square.new(id: 'c1', x: 2, y: 9, piece: nil)

      squares = JustXiangqi::SquareSet.new(squares: [from, orthogonal, diagonal, outside_palace])

      game_state = JustXiangqi::GameState.new(current_player_number: 1, squares: squares)

      result = jiang.destinations(from, game_state)

      assert_includes(result, orthogonal)
      refute_includes(result, diagonal)
      refute_includes(result, outside_palace)
    end

    it 'does not return the squares that are blocked' do
      jiang = JustXiangqi::Jiang.new(id: 1, player_number: 1)
      friendly = JustXiangqi::Zu.new(id: 2, player_number: 1)
      from = JustXiangqi::Square.new(id: 'd1', x: 3, y: 9, piece: jiang)
      orthogonal = JustXiangqi::Square.new(id: 'd2', x: 3, y: 8, piece: friendly)
      diagonal = JustXiangqi::Square.new(id: 'e2', x: 4, y: 8, piece: nil)
      outside_palace = JustXiangqi::Square.new(id: 'c1', x: 2, y: 9, piece: nil)

      squares = JustXiangqi::SquareSet.new(squares: [from, orthogonal, diagonal, outside_palace])

      game_state = JustXiangqi::GameState.new(current_player_number: 1, squares: squares)

      result = jiang.destinations(from, game_state)

      refute_includes(result, orthogonal)
      refute_includes(result, diagonal)
      refute_includes(result, outside_palace)
    end
  end
end
