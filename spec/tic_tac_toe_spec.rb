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

describe Game do
let(:game) { Game.new }
end

describe Player do
describe '#player_name' do
let(:player) { Player.new(1) }
it 'Should prompt the user for a name and assign the value to a variable' do
  expect(player.name).not_to eql(nil)
end
it 'Should '
end
end

describe Table do
end

describe '#clear_input' do
  it 'Should prompt the user and return a value striped of white spaces' do
    expect('y').to eql('y')
  end
end
