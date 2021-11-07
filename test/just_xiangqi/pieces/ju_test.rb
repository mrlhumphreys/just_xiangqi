require 'minitest/autorun'
require 'minitest/spec'
require 'just_xiangqi/pieces/ju'
require 'just_xiangqi/square'
require 'just_xiangqi/square_set'
require 'just_xiangqi/game_state'

describe JustXiangqi::Ju do
  describe '#destinations' do
    it 'returns the squares it can move to if unoccupied' do
      ju = JustXiangqi::Ju.new(id: 1, player_number: 1)
      from = JustXiangqi::Square.new(id: 'a1', x: 0, y: 9, piece: ju)
      orthogonal = JustXiangqi::Square.new(id: 'a2', x: 0, y: 8, piece: nil)
      diagonal = JustXiangqi::Square.new(id: 'b2', x: 1, y: 8, piece: nil)

      squares = JustXiangqi::SquareSet.new(squares: [from, orthogonal, diagonal])

      game_state = JustXiangqi::GameState.new(current_player_number: 1, squares: squares)

      result = ju.destinations(from, game_state)

      assert_includes(result, orthogonal)
      refute_includes(result, diagonal)
    end

    it 'returns the squares it can move to if occupied by opponent' do
      ju = JustXiangqi::Ju.new(id: 1, player_number: 1)
      from = JustXiangqi::Square.new(id: 'a1', x: 0, y: 9, piece: ju)
      orthogonal_piece = JustXiangqi::Ju.new(id: 2, player_number: 2)
      orthogonal = JustXiangqi::Square.new(id: 'a2', x: 0, y: 8, piece: orthogonal_piece)
      diagonal_piece = JustXiangqi::Ju.new(id: 3, player_number: 2)
      diagonal = JustXiangqi::Square.new(id: 'b2', x: 1, y: 8, piece: diagonal_piece)

      squares = JustXiangqi::SquareSet.new(squares: [from, orthogonal, diagonal])

      game_state = JustXiangqi::GameState.new(current_player_number: 1, squares: squares)

      result = ju.destinations(from, game_state)

      assert_includes(result, orthogonal)
      refute_includes(result, diagonal)
    end

    it 'does not return the squares that are blocked' do
      ju = JustXiangqi::Ju.new(id: 1, player_number: 1)
      from = JustXiangqi::Square.new(id: 'a1', x: 0, y: 9, piece: ju)
      orthogonal_piece = JustXiangqi::Ju.new(id: 2, player_number: 1)
      orthogonal = JustXiangqi::Square.new(id: 'a2', x: 0, y: 8, piece: orthogonal_piece)
      diagonal_piece = JustXiangqi::Ju.new(id: 3, player_number: 1)
      diagonal = JustXiangqi::Square.new(id: 'b2', x: 1, y: 8, piece: diagonal_piece)

      squares = JustXiangqi::SquareSet.new(squares: [from, orthogonal, diagonal])

      game_state = JustXiangqi::GameState.new(current_player_number: 1, squares: squares)

      result = ju.destinations(from, game_state)

      refute_includes(result, orthogonal)
      refute_includes(result, diagonal)
    end
  end
end
