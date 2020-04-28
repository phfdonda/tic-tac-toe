# lib/game.rb

# Comment
class Game
  def initialize(to_play = nil)
    @options = [%w[1 2 3], %w[4 5 6], %w[7 8 9]]
    @turn_counter = 0
    @game_ended = false
    @victory = false
    @pretty_intro = [' WELCOME!',
                     '',
                     '<3 I love that you are here! <3 ',
                     ' I was sitting in this repository, waiting for you all day long... ',
                     '',
                     ' Since we are all together now, how about we play a game?',
                     ' You know, I may be old, but I can be quite fun! ',
                     '',
                     ' Oh, geez, but where are my manners? Let us introduce ourselves! ',
                     ' My name is Tic-Tac-Toe. My pleasure! ']
    @game_description = ['Tic-Tac-Toe Game',
                         'In this game, wins that who can mark ',
                         ' three numbers in a sequence.',
                         ' Players take turns to mark the numbers.',
                         " The first will have X's as marks, ",
                         "the second will have O's.",
                         'You can have sequences in diagonal, horizontal or ',
                         ' vertical alignment.',
                         'If no number can be chosen, and no three numbers ',
                         ' in sequence were chosen,',
                         "then there's no winner, and the game ends.",
                         '',
                         '']
    @rules = [" Would you like to read the rules of the game? \n",
              " Yes or No? You can just type 'y' or 'n' for short. ",
              ' Alright! Here comes the rules!',
              ' Okey-dokey! You know the drills, I see.',
              " Let's get to it, then! ",
              " I hope you don't find me too rude,",
              " but you're not making any sense. ",
              " Look, it's actually pretty easy, ",
              " it's a 'yes' or 'no' question, see? "]
    @table = Table.new
    start(to_play)
  end

  def check_victory(sequence)
    return true && @game_ended = true && @victory = true if sequence

    false
  end

  private

  def start(to_play = nil)
    return if to_play.nil?

    intro
    @player1 = Player.new(1)
    @player2 = Player.new(2)
    @winner = 'Nobody'
    turn
  end

  def about
    pretty_print(@game_description)
    pretty_print(' Press ENTER to continue ')
    @press_enter_to_continuer = clear_input
  end

  def intro
    system 'clear'
    make_space
    pretty_print(@pretty_intro, ' ')
  end

  def rules
    pretty_print([@rules[0], @rules[1]])
    @answer = clear_input
    if %w[y yes].include?(@answer.downcase)
      clear_print(@rules[2])
      about
    elsif %w[n no].include?(@answer.downcase)
      clear_print([@rules[3], @rules[4]])
    else
      clear_print([@rules[5], @rules[6], @rules[7], @rules[8]])
      rules
    end
  end

  def turn
    rules
    pretty_print('', '*')
    pretty_print
    @table.redraw_table
    pretty_print
    pretty_print('', '*')
    until @game_ended
      @turn_counter += 1
      @player = @turn_counter.odd? ? @player1 : @player2
      pretty_print("It's #{@player.name}'s turn")
      @move = @player.make_choice
      @pos = @table.get_choice_position(@move)
      @table.mark_choice(@move, @player.mark)
      @table.redraw_table
      check_victory(@table.sequence?(@pos))
      @game_ended = true if @turn_counter == 9
    end
    celebrate_or_not
  end

  def celebrate_or_not
    make_space
    @exclamation = 'Yikes, a tie!'
    @comment = 'That was lame...'
    @winner = @player.name if @game_ended && @victory
    if @victory
      @exclamation = 'Congratulations!'
      @comment = 'Excellent game!'
    end
    pretty_print("#{@exclamation} #{@winner} won! #{@comment}")
    make_space
  end
end
