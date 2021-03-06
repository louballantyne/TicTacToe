require 'board'

describe Board do
  
  before(:each) do
    @scoreX = double('ScoreX', :player => 'X', :fields => [])
    @scoreO = double('ScoreO', :player => 'O', :fields => [])
    subject.instance_variable_set(:@scoreX, @scoreX)
    subject.instance_variable_set(:@scoreO, @scoreO)
    allow(@scoreX).to receive(:calc)
    allow(@scoreO).to receive(:calc)
  end

  describe 'the bounds of the board' do
    it 'allows a player to fill a slot if the row and column is 1-3' do
      subject.turn(1,1,'X')
      expect(subject.fields.first).to be_a_kind_of Field
    end
    it 'will not let a player have a turn if the row and column are not 1-3' do
      expect(subject.turn(8,8,'X')).to eq "Row or column lies outside of bounds"
    end
  end

  context 'a player has already claimed field 1,1' do
    it 'will not allow another player to claim the same field' do
      subject.turn(1,1,'X')
      expect(subject.turn(1,1,'O')).to eq "field in use"
    end
  end

  context 'the board is full but nobody has won' do
    it 'declares the game to be over' do
      subject.turn(1,1,'X')
      subject.turn(1,2,'O')
      subject.turn(1,3,'X')
      subject.turn(2,1,'O')
      subject.turn(2,3,'X')
      subject.turn(2,2,'O')
      subject.turn(3,2,'X')
      subject.turn(3,3,'O')
      expect(subject.turn(3,1,'X')).to eq 'Board full - game over'
    end
  end

  context "The correct Score instance is called depending on the player" do
    it "ScoreX is called to calculate when the player is 'X'" do
      expect(@scoreX).to receive(:calc)
      subject.turn(1,1,'X')
    end
    it "ScoreO is called to calculate when the player is 'O'" do
      expect(@scoreO).to receive(:calc)
      subject.turn(1,1,'O')
    end
  end

  context 'Score has successfully saved the score' do
    it "Returns 'Success' if the result is nil" do
      allow(@scoreX).to receive(:calc) { nil }
      expect(subject.turn(1,1,'X')).to eq 'Success'
    end
  end

  context 'Somebody has won the game' do
    it 'returns the message containing the winner' do
      allow(@scoreX).to receive(:calc) { "Player X is the Winner - game over" }
      expect(subject.turn(1,1,'X')).to eq 'Player X is the Winner - game over'
    end
  end
end
