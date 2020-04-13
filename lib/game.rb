# frozen_string_literal: true

# Comment
class Game
  def initialize
    @options = [%w[1 2 3], %w[4 5 6], %w[7 8 9]]
    @turn_counter = 0
    @game_ended = false
    @victory = false
    @table = Table.new
    intro
    @player1 = Player.new(1)
    @player2 = Player.new(2)
    @winner = 'Nobody'
    start
  end

  def about
    @game_description = ['Tic-Tac-Toe Game',
                         'In this game, wins that who can mark three numbers in a sequence.',
                         'Players take turns to mark the numbers.', "The first will have X's as marks, the second will have O's.",
                         'You can have sequences in diagonal, horizontal or vertical alignment.',
                         'If no number can be chosen, and no three numbers in sequence were chosen,',
                         "then there's no winner, and the game ends.",
                         '',
                         '']

    pretty_print(@game_description)
    pretty_print(' Press ENTER to continue ')
    @press_enter_to_continuer = clear_input
                      end

  def intro
    system 'clear'
    make_space
    @pretty_intro = [' WELCOME!',
                     '',
                     '<3 I love that you are here! <3 ',
                     ' I was sitting in this repository, waiting for you all day long... ',
                     '',
                     ' Since we are all together now, how about we play a game? ',
                     ' You know, I may be old, but I can be quite fun! ',
                     '',
                     ' Oh, geez, but where are my manners? Let us introduce ourselves! ',
                     ' My name is Tic-Tac-Toe. My pleasure! ']
    pretty_print(@pretty_intro, ' ')
  end

  def start
    turn
  end

  def rules?
    pretty_print(" Would you like to read the rules of the game? \n")
    pretty_print(" Yes or No? You can just type 'y' or 'n' for short. ")
    @answer = clear_input
    if %w[y yes].include?(@answer.downcase)
      make_space
      pretty_print(' Alright! Here comes the rules!')
      make_space
      about
    elsif %w[n no].include?(@answer.downcase)
      make_space
      pretty_print(" Okey-dokey! You know the drills, I see. Let's get to it, then! ", '.')
      make_space
    else
      make_space
      pretty_print(" I hope you don't find me too rude, but you're not making any sense. ")
      pretty_print(" Look, it's actually pretty easy, it's a 'yes' or 'no' question, see? ")
      make_space
      rules?
    end
  end

  def turn
    rules?
    @table.redraw_table
    until @game_ended
      @turn_counter += 1
      @player = @turn_counter.odd? ? @player1 : @player2
      pretty_print("It's #{@player.name}'s turn")
      @move = @player.choice
      @pos = @table.get_choice_position(@move)
      @table.mark_choice(@move, @player.mark)
      @table.redraw_table
      check_victory(@table.check_for_seq(@pos))
      @game_ended = true if @turn_counter == 9
    end
    make_space
    celebrate_or_not
    make_space
    end

  def celebrate_or_not
    @exclamation = 'Yikes, a tie!'
    @comment = 'That was lame...'
    @winner = @player.name if @game_ended && @victory
    if @victory
      @exclamation = 'Congratulations!'
      @comment = 'Excellent game!'
    end
    pretty_print("#{@exclamation} #{@winner} won! #{@comment}")
end

  def check_victory(sequence)
    @game_ended = true && @victory = true if sequence
  end
end
