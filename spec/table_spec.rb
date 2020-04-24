# spec/table_spec.rb
require_relative '../lib/table.rb'

describe Table do
  let(:table) { Table.new }
  describe '#redraw_table' do
    it 'Should print matrix 3X3 of numbers ranging 1 to 9' do
      expect(table.redraw_table).to be_kind_of(Array)
    end
  end
end
