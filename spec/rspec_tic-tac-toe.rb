# spec/rspec_tic-tac-toe.rb
require './bin/main'
require './lib/game.rb'
require './lib/table.rb'
require './lib/player.rb'

describe Game do
  let(:game) { Game.new }
end

describe Player do
  let(:player) { Player.new }

  describe '#player_name' do
    it 'Should prompt the user for a name' do
      expect(player).to receive(:clear_input)
    end
  end
end

describe Table do
  let(:table) { Table.new }
end

# describe '#clear_input' do
#   it 'Should prompt the user and return a value striped of white spaces' do
#     expect()
#   end
# end
