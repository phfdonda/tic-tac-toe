# spec/table_spec.rb
require_relative '../lib/table.rb'

describe Table do
  let(:table) { Table.new }
  describe '#redraw_table' do
    it 'Should print matrix 3X3 of numbers ranging 1 to 9' do
      system 'clear'
      table.redraw_table
      expect($stdout.gets.strip).to eql('f')
    end
  end
end
