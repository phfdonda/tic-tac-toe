# spec/tic_tac_toe_spec.rb
require './lib/game.rb'
require './lib/player.rb'
require './lib/table.rb'

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

test_number = rand(10)

describe Game do
let(:game) { Game.new }
end

describe Player do
  let(:player1) { Player.new(1) }
  let(:player2) { Player.new(2) }

  describe '#player_name' do
    it 'Should prompt the user for a name and accept only non-nil/blank values' do
      expect(player1.name).not_to eql(nil)
    end
    it 'Should prompt the user for a name different than the first' do
      expect(player1.name).not_to eql(player2.name)
    end
  end

  describe '#make_choice' do
    it 'Should accept only numbers between 0 and 9 inclusive' do
      expect(player1.).to eql()
    end
  end
end

describe Table do
end

describe '#clear_input' do
  it 'Should prompt the user and return a value striped of white spaces' do
    expect('y').to eql('y')
  end
end
