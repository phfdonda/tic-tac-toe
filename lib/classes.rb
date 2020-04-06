# frozen_string_literal: true

class Game
  # This class is supposed to contain all game logic.

  def initialize
    @@possible_numbers = %w[1 2 3 4 5 6 7 8 9]
    @game_ended = false
    # Create the instance of the Table class
    @table = Table.new
    # Create the instance of the first player
    @@player_1 = Player.new(1)
    # Create the instance of the second player
    @@player_2 = Player.new(2)
    @winner = 'Nobody'
    @game_description = "Tic-Tac-Toe Game
 In this game, wins that who can mark three numbers in a sequence.
 Players take turns to mark the numbers. The first will have X's as marks,
the second will have O's. They can be in diagonal, horizontal or vertical alignment.
If no number can be chosen, and no three numbers in sequence were chosen,
then there's no winner, and the game ends."
    start
  end

  def about
    @game_description
  end

  def start
    puts about

    puts "\nLet the game begin!\n"
    turn
  end

  def turn
    # This is the main loop of the game. It keeps running while there are three numbers not chosen in a sequence.
    @turn_counter = 1

    until game_ended
      @@player = if @turn_counter.odd?
                   game.player_1
                 else
                   game.player_2
                end
      puts "It's #{@@player.name}'s turn"
    end

    puts "#{winner} won!"
  end

  def rules(matrix)
    # This method will check if the choice completes the sequence. If it does, it will change the variable game_ended to true.
  end
end

class Table
  # This class is supposed to contain the information about the table itself and render it to the user: that means it contains a matrix 3X3 of integers ranging from 1 to 9. The numbers are exchanged to 'O' or 'X' depending on the game logic.
  # It should allow for Game class to retrieve and send information to change the table display.
  # There must be a method to print the current table.
  def initialize
    @table = [%w[1 2 3], %w[4 5 6], %w[7 8 9]]
  end

  def print_table
    @table.each do |r|
      puts r.each { |x| x }.join(' | ')
    end
  end

  def mark(choice); end
end

class Player < Game
  # This class contains the information about the player - for this game, only the name, actually. It also allows the game logic to display the victor.
  # This class is also responsible for picking up the player's choice. There must be a method for that.

  # Variables

  def initialize(n_p)
    @n_p = n_p
    player_name
  end

  attr_reader :name

  def player_name
    # This checks if the name it's not blank, and the second one is not the same as the first one.

    @answer = ''
    if @n_p == 1
      puts "Please, type Player 1's name: "
      @answer = gets.chomp
      while @answer.strip.empty?
        puts "Please, don't leave it blank. Write something."
        @answer = gets.chomp.strip.capitalize
      end
      @name = @answer
      p "Player 1's name is #{@name}"
    elsif @n_p == 2
      puts "Please, type Player 2's name: "
      @answer = gets.chomp
      while @answer.strip.empty?
        puts "Please, don't leave it blank. Write something."
        @answer = gets.chomp
        while @answer.strip.capitalize == @@player_1.name
          puts "This is Player 1's name. Please choose another one."
          @answer = gets.chomp
        end
      end

      p "Player 2's name is #{@name}"
    end
    @n_p += 1
  end

  def player_choice
    # This checks if the player chose a number that was available, provided by the Game instance. If the information is correct, it passes the information to the Game instance as a matrix 3X3.

    attr_writer :choice

    puts 'Type one of the numbers available to mark your choice'

    until @@possible_numbers.include(@choice)
      puts 'You must choose a number from 1 to 9 that was still not chosen'

    end
  end
end
