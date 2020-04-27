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

  describe '#get_choice_position' do
    it 'Should extract the position from the number chosen' do
      expect(table.get_choice_position('5')).to eql([1, 1])
    end
  end

  describe '#table_marks' do
   it 'Should return all the numbers available' do
   expect(table.table_marks).to eql([%w[1 2 3], %w[4 5 6], %w[7 8 9]])
   end
   it 'Should return the numbers with the 3 exchanged for O' do
   table.mark_choice('3', 'O')
   expect(table.table_marks).to eql([%w[1 2 O], %w[4 5 6], %w[7 8 9]])
   end
  end

  describe '#mark_choice' do
    it 'Should mark the number chosen and replace it by the mark provided' do
      table.mark_choice('1', 'X')
      expect(table.table_marks).to eql([%w[X 2 3], %w[4 5 6], %w[7 8 9]])
    end
  end

  describe '#sequence?' do
    it 'Should return true for a horizontal sequence' do
      table.mark_choice('1', 'X')
      table.mark_choice('2', 'X')
      table.mark_choice('3', 'X')
      expect(table.sequence?([0, 1])).to eql(true)
    end
    it 'Should return true for a vertical sequence' do
       table.mark_choice('1', 'X')
       table.mark_choice('4', 'X')
       table.mark_choice('7', 'X')
       expect(table.sequence?([1, 0])).to eql(true)
    end
    it 'Should return true for a diagonal sequence' do
       table.mark_choice('1', 'X')
       table.mark_choice('5', 'X')
       table.mark_choice('9', 'X')
       expect(table.sequence?([1, 1])).to eql(true)
    end
    it 'Should return false if no sequence is made' do
      table.mark_choice('1', 'X')
      table.mark_choice('2', 'O')
      table.mark_choice('3', 'X')
      expect(table.sequence?([0, 1])).to eql(false)
    end
  end
end
