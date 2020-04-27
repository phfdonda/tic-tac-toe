# spec/player_spec.rb
require_relative '../lib/player.rb'

def reg_print(text = '')
  if text.is_a?(Array)
    text.each { |x| print x }
  elsif text.is_a?(String)
    print text
  end
end

def clear_print(print = ' ', marker = ' ')
  make_space
  pretty_print(print, marker)
  make_space
end

def make_space
  pretty_print
  pretty_print('', '.')
  pretty_print
end

def pretty_print(text = '', ext = ' ')
  if text.is_a?(Array)
    text.each { |x| puts x.center(100, ext) }
  elsif text.is_a?(String)
    puts text.center(100, ext)
  end
end

def clear_input
  gets.chomp.strip
end

possible_numbers = %w[1 2 3 4 5 6 7 8 9]

describe Player do
  let(:player1) { Player.new(1, 'Link') }
  let(:player2) { Player.new(2, 'Zelda') }

  describe '#available_numbers' do
    it 'Should return the numbers that are still available for choosing' do
      expect(player1.available_numbers).to eql(possible_numbers)
    end
  end

  describe '#make_choice' do
    it 'Should accept only a number between 1 and 9' do
      player1.make_choice('2')
      expect(player1.available_numbers).to eql(%w[1 3 4 5 6 7 8 9])
    end

    it 'Should raise an error when an invalid value is passed as an argument' do
      expect { player1.make_choice('#') }.to raise_error('The number must be between 1 and 9')
    end
  end
end
