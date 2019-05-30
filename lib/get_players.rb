require_relative './moves.rb'
require_relative './display_text.rb'
require_relative './content.rb'
require_relative './menu_option.rb'
require_relative './counter.rb'
require_relative './get_input.rb'
require_relative './marker.rb'

module GetPlayers
  NUMBER_OF_PLAYERS = 2

  def self.current_player(board, player1, player2)
    Moves.turn_count(board.cells).even? ? player1 : player2
  end

  def self.opponent(board, player1, player2)
    Moves.turn_count(board.cells).odd? ? player1 : player2
  end

  def self.get(get_input=GetInput.new)
    players = []
    NUMBER_OF_PLAYERS.times do |number|
      player_number = number + 1
      print Content.menu(player_number)
      user_input = get_input.call
      players << get_player(user_input, player_number)
    end
    players
  end

  def self.get_player(user_input, player_number)
    if player_number == 1
      marker = Marker::X
    else
      marker = Marker::O
    end

    if user_input == '1'
      player = Player::Human.new(marker)
    else
      player = Player::Ai.new(marker)
    end
  end
end