# Comment
class Player
  def initialize(n_p)
    @@possible_numbers = %w[1 2 3 4 5 6 7 8 9]
    @n_p = n_p
    give_mark
    player_name
  end

  def give_mark
    if @n_p == 1
      @mark = 'X'
    elsif @n_p == 2
      @mark = 'O'
    end
  end

  attr_reader :mark
  attr_reader :choice
  attr_reader :name

  def player_name
    @p_script = [" Well, let me know, who is this beauty that I'm talking to? ",
                 "Oh, please, don't give me the silent treatment! Say something!", "Who's the first player?"]
    @answer = ''
    if @n_p == 1
      clear_print(@p_script[0])
      reg_print('Player 1: ')
      @answer = clear_input
      while @answer.empty?
        clear_print(@p_script[1])
        reg_print('Player 1: ')
        @answer = clear_input
      end
      @name = @answer
      @@p1_name = @name
      clear_print(" That's a beautiful name, #{@name}! You'll be Player 1, and your mark is X ",'*')
    elsif @n_p == 2
      pretty_print("Now, who's our friend that'll be playing with us?", '.')
      pretty_print
      reg_print('Player 2: ')
      @answer = clear_input
      while @answer.empty? || @answer == @@p1_name
        while @answer.empty?
          pretty_print
          pretty_print(" Now, now, how can I call you if you won't tell me your name? ", '.')
          pretty_print(" Who's the second player? ")
          reg_print('Player 2: ')
          @answer = clear_input
        end
        while @answer == @@p1_name
          pretty_print
          pretty_print(" Wait. You're twins or somethn'? Give me a different name! ", '.')
          reg_print('Player 2: ')
          @answer = clear_input
        end
      end
      @name = @answer
      @@p2_name = @name
      clear_print(" That's funny, I have a cousin called #{@name} too! ",'*')
      pretty_print(" #{@name}, you'll have the 'O' mark, and you'll be Player 2! ")
      make_space
    end
  end

  def make_choice
    pretty_print(' Type one of the numbers available to mark your choice ', '.')
    @choice = clear_input
    until @@possible_numbers.include?(@choice)
      pretty_print(' Oh no. You must choose a number from 1 to 9 that was still not chosen ! ', ' ')
      @choice = clear_input
    end
    pretty_print(' Good choice! ', ' ')
    @@possible_numbers.delete(@choice)
    @choice
  end
end
