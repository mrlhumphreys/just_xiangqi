require 'minitest/autorun'
require 'minitest/spec'
require 'just_xiangqi/pieces/zu'
require 'just_xiangqi/square'
require 'just_xiangqi/square_set'
require 'just_xiangqi/game_state'

describe JustXiangqi::Zu do
  describe '#destinations' do
    it 'returns forwards if on own side' do
      zu = JustXiangqi::Zu.new(id: 1, player_number: 1)
      from = JustXiangqi::Square.new(id: 'a4', x: 0, y: 6, piece: zu)
      front = JustXiangqi::Square.new(id: 'a5', x: 0, y: 5, piece: nil)
      diagonal = JustXiangqi::Square.new(id: 'b5', x: 1, y: 5, piece: nil)
      side = JustXiangqi::Square.new(id: 'b4', x: 1, y: 6, piece: nil)
      back = JustXiangqi::Square.new(id: 'a3', x: 0, y: 7, piece: nil)

      squares = JustXiangqi::SquareSet.new(squares: [from, front, diagonal, side, back]) 

      game_state = JustXiangqi::GameState.new(current_player_number: 1, squares: squares)

      result = zu.destinations(from, game_state)

      assert_includes(result, front)
      refute_includes(result, diagonal)
      refute_includes(result, back)
      refute_includes(result, side)
    end

    it 'returns same rank if on opposing side' do
      zu = JustXiangqi::Zu.new(id: 1, player_number: 1)
      from = JustXiangqi::Square.new(id: 'a6', x: 0, y: 4, piece: zu)
      front = JustXiangqi::Square.new(id: 'a7', x: 0, y: 3, piece: nil)
      diagonal = JustXiangqi::Square.new(id: 'b7', x: 1, y: 3, piece: nil)
      side = JustXiangqi::Square.new(id: 'b6', x: 1, y: 4, piece: nil)
      back = JustXiangqi::Square.new(id: 'a5', x: 0, y: 5, piece: nil)

      squares = JustXiangqi::SquareSet.new(squares: [from, front, diagonal, side, back]) 

      game_state = JustXiangqi::GameState.new(current_player_number: 1, squares: squares)

      result = zu.destinations(from, game_state)

      assert_includes(result, front)
      refute_includes(result, diagonal)
      refute_includes(result, back)
      assert_includes(result, side)
    end
  end
end
