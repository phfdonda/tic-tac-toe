# lib/table.rb

# Comment
class Table
  def initialize
    @options = [%w[1 2 3], %w[4 5 6], %w[7 8 9]]
  end

  def table_marks
    @options
  end

  def redraw_table
    @options.each do |element|
      pretty_print(element.join(' | '))
    end
  end

  def sequence?(position)
    @i = position[0]
    @j = position[1]
    @player_mark = @options[@i][@j]
    if @options[1][1] == @player_mark
      if @j.zero? || @j == 2
        return true if @options[op_ind(@i)][op_ind(@j)] == @player_mark elsif @i == 1 && @j == 1
              if @options.each_with_index.any? { |x, i| x.first == @player_mark && @options[op_ind(i)].last == @player_mark }
              return true
              end
      end
    end
    return true if @options[@i].all? { |x| x == @player_mark }
    return true if @options.each.all? { |x| x[@j] == @player_mark }

    false
  end

  def get_choice_position(choice)
    @options.each_with_index do |inner_array, i|
      inner_array.each_with_index do |value, j|
        @position = [i, j] if value == choice
      end
    end
    @position
  end

  def mark_choice(choice, mark)
    @options.each do |inner_array|
      inner_array.map! { |i| i == choice ? mark : i }
    end
  end

  private

  def op_ind(ind)
     if ind.zero?
       2
     elsif ind == 2
       0
     else
       ind
     end
  end
end
