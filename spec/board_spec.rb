require 'board'

describe Board do
  describe 'the bounds of the board' do
    it 'allows a player to fill a slot if the row and column is 1-3' do
      subject.turn(1,1,1)
      expect(subject.fields.first).to be_a_kind_of Field
    end
    it 'will not let a player have a turn if the row and column are not 1-3' do
      expect(subject.turn(8,8,8)).to eq "Row or column lies outside of bounds"
    end
  end

  describe 'a player has already claimed field 1,1' do
    it 'will not allow another player to claim the same field' do
      subject.turn(1,1,1)
      expect(subject.turn(1,1,2)).to eq "field in use"
    end
  end
end
