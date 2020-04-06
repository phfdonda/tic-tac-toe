# frozen_string_literal: true

module InputChecker
  def p_has_a_name(player)
    false if player.name.nil? || player.name.empty?
    true
  end
end

module Screen
  def pretty_start
    system 'clear'
    puts 'WELCOME!'.center(60, '.')
    sleep 1.2
    puts 'I love that you are here!'.center(60, '.')
    puts ''.center(60, '.')
    sleep 1.7
    puts 'Since you are, how about we play a game?'.center(60, '.')
  end
end
