# spec/table_spec.rb
require_relative '../lib/table.rb'

describe Table do
  let(:table) { Table.new }
  describe '#redraw_table' do
    it 'Should print the first line of a matrix 3X3 of numbers ranging 1 to 9' do
      $stdout = StringIO.new
      system 'clear'
      table.redraw_table
      $stdout.rewind
      expect($stdout.gets.strip).to eql('1 | 2 | 3')
    end
  end

  
end
