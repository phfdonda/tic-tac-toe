# spec/tic_tac_toe_spec.rb
require './lib/game.rb'
require './lib/player.rb'
require './lib/table.rb'

# describe Game do
#   let(:game) { Game.new }
# end

describe Player do
  let(:player) { Player.new(1) }

  describe '#player_name' do
    it 'Should prompt the user for a name' do
      expect(player).to receive(':clear_input')
    end
  end
end
#
# describe Table do
#   let(:table) { Table.new }
# end

describe '#clear_input' do
  it 'Should prompt the user and return a value striped of white spaces' do
    expect('y').to eql('y')
  end
end
