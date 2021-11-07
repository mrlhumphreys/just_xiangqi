require 'minitest/autorun'
require 'minitest/spec'
require 'just_xiangqi/pieces/shi'
require 'just_xiangqi/square'
require 'just_xiangqi/square_set'
require 'just_xiangqi/game_state'

describe JustXiangqi::Shi do
  describe '#destinations' do
    it 'returns the squares it can move to if unoccupied' do
      shi = JustXiangqi::Shi.new(id: 1, player_number: 1)
      from = JustXiangqi::Square.new(id: 'd1', x: 3, y: 9, piece: shi)
      orthogonal = JustXiangqi::Square.new(id: 'd2', x: 3, y: 8, piece: nil)
      diagonal = JustXiangqi::Square.new(id: 'e2', x: 4, y: 8, piece: nil)
      outside_palace = JustXiangqi::Square.new(id: 'b2', x: 1, y: 8, piece: nil)

      squares = JustXiangqi::SquareSet.new(squares: [from, orthogonal, diagonal, outside_palace])

      game_state = JustXiangqi::GameState.new(current_player_number: 1, squares: squares)

      result = shi.destinations(from, game_state)

      refute_includes(result, orthogonal)
      assert_includes(result, diagonal)
      refute_includes(result, outside_palace)
    end

    it 'returns the squares it can move to if occupied by opponent' do
      shi = JustXiangqi::Shi.new(id: 1, player_number: 1)
      opponent = JustXiangqi::Zu.new(id: 1, player_number: 2)
      from = JustXiangqi::Square.new(id: 'd1', x: 3, y: 9, piece: shi)
      orthogonal = JustXiangqi::Square.new(id: 'd2', x: 3, y: 8, piece: nil)
      diagonal = JustXiangqi::Square.new(id: 'e2', x: 4, y: 8, piece: opponent)
      outside_palace = JustXiangqi::Square.new(id: 'b2', x: 1, y: 8, piece: nil)

      squares = JustXiangqi::SquareSet.new(squares: [from, orthogonal, diagonal, outside_palace])

      game_state = JustXiangqi::GameState.new(current_player_number: 1, squares: squares)

      result = shi.destinations(from, game_state)

      refute_includes(result, orthogonal)
      assert_includes(result, diagonal)
      refute_includes(result, outside_palace)
    end

    it 'does not return the squares that are blocked' do
      shi = JustXiangqi::Shi.new(id: 1, player_number: 1)
      friendly = JustXiangqi::Zu.new(id: 1, player_number: 1)
      from = JustXiangqi::Square.new(id: 'd1', x: 3, y: 9, piece: shi)
      orthogonal = JustXiangqi::Square.new(id: 'd2', x: 3, y: 8, piece: nil)
      diagonal = JustXiangqi::Square.new(id: 'e2', x: 4, y: 8, piece: friendly)
      outside_palace = JustXiangqi::Square.new(id: 'b2', x: 1, y: 8, piece: nil)

      squares = JustXiangqi::SquareSet.new(squares: [from, orthogonal, diagonal, outside_palace])

      game_state = JustXiangqi::GameState.new(current_player_number: 1, squares: squares)

      result = shi.destinations(from, game_state)

      refute_includes(result, orthogonal)
      refute_includes(result, diagonal)
      refute_includes(result, outside_palace)
    end
  end
end
