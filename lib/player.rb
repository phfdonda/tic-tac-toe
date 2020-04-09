# frozen_string_literal: true

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
    @answer = ''
    if @n_p == 1
      puts
      puts "Well, let me know, who's the first player? ".center(100, '.')
      print "Player 1: "
      @answer = gets.chomp.strip
      while @answer.empty?
        puts
        puts "Oh, please, don't give me the silent treatment! Say something!".center(100, ' ')
        puts "Who's the first player?".center(100, '.')
        print "Player 1: "
        @answer = gets.chomp.strip
      end
      @name = @answer
      @@p1_name = @name
      puts
      puts "That's a beautiful name, #{@name}! You'll be Player 1, and your mark is X".center(100, ' ')
    elsif @n_p == 2
      puts "Now, who's our friend that's going to play with us?".center(100, '.')
      print "Player 2: "
      @answer = gets.chomp.strip
      while @answer.empty? || @answer == @@p1_name
        while @answer.empty?
          puts
          puts "Now, now, how can I call you if you won't tell me your name?".center(100, '.')
        puts "Who's the second player?".center(100, '.')
          print "Player 2: "
          @answer = gets.chomp.strip
        end
        while @answer == @@p1_name
          puts
          puts "Wait. You're twins or somethn'? Give me a different name!".center(100, '.')
          print "Player 2: "
          @answer = gets.chomp.strip
        end
      end
      @name = @answer
      @@p2_name = @name
      puts
      puts "That's funny, I had a cousing called #{@name} too!".center(100, '.')
      puts "#{@name}, you'll have the 'O' mark, and you'll be Player 2!".center(100, ' ')
      puts
    end
  end

  def choice
    puts 'Type one of the numbers available to mark your choice'
    @choice = gets.chomp
    until @@possible_numbers.include?(@choice)
      puts 'You must choose a number from 1 to 9 that was still not chosen'
      @choice = gets.chomp
    end
    puts 'Good choice!'
    @@possible_numbers.delete(@choice)
    @choice
  end
end
