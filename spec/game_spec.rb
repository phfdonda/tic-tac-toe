# spec/game_spec.rb
require_relative '../lib/game.rb'

describe Game do
  let(:game) { Game.new }
  describe '#check_victory' do
    it 'Should return true for VICTORY - and the automatic DEFEAT of the opponent' do
      expect(game.check_victory(true)).to eql(true)
    end
    it 'Should return false for absence of victory - in other words, a DRAW' do
      expect(game.check_victory(false)).to eql(false)
    end
  end
end
