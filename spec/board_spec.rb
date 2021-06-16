require 'board'

describe Board do
  describe 'the bounds of the board' do
    it 'allows a player to fill a slot if the row and column is 0-3' do
      subject.turn(1,1,1)
      expect(subject.fields.first).to be_a_kind_of Field
    end
  end
end
