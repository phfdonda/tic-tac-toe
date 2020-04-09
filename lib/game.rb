# frozen_string_literal: true

class Game
  def initialize
    @options = [%w[1 2 3], %w[4 5 6], %w[7 8 9]]
    @turn_counter = 0
    @game_ended = false
    @table = Table.new
    @player_1 = Player.new(1)
    @player_2 = Player.new(2)
    @winner = 'Nobody'
    start
  end

  def about
    @game_description = ['Tic-Tac-Toe Game',
                         'In this game, wins that who can mark three numbers in a sequence.',
                         "Players take turns to mark the numbers.", "The first will have X's as marks, the second will have O's.",
                         'They can be in diagonal, horizontal or vertical alignment.',
                         'If no number can be chosen, and no three numbers in sequence were chosen,',
                         "then there's no winner, and the game ends."]
 
                        @game_description.each { |x| puts x.center(100, ' ') }
                      end

  def intro
    puts ' Let the game begin! '.center(80, '.')
  end

  def start
    turn
  end

  def announce_turn; end

  def turn
    about
    @table.print_table
    until @game_ended
      @turn_counter += 1
      @player = @turn_counter.odd? ? @player_1 : @player_2
      puts "It's #{@player.name}'s turn"
      @move = @player.choice
      @pos = @table.get_choice_position(@move)
      @table.mark_choice(@move, @player.mark)
      @table.print_table
      check_victory(@table.check_for_seq(@pos))

    end
    celebrate_or_not
    end

  def celebrate_or_not
    @winner = @player.name if @game_ended
    puts "#{@winner} won!"
end

  def check_victory(sequence)
    @game_ended = true if sequence
  end
end
