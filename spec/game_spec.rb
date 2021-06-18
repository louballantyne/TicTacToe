require 'game'

describe Game do
  before(:each) do
    @board = double('Board')
    subject.instance_variable_set(:@board, @board)
    allow(@board).to receive(:turn) { "Success" }
  end
  describe 'turn' do
    it 'allows a player to take a turn by calling Board' do
      expect(@board).to receive(:turn)
      subject.play(1,1)
    end
  end

  context 'the players are alternated from one turn to the next' do
    it 'has a first turn of player X, then a second turn of player O' do
      expect(subject.instance_variable_get(:@player)).to eq 'X'
      subject.play(1,1)
      expect(subject.instance_variable_get(:@player)).to eq 'O'
    end
  end

  describe "#check_over returns the result unless it receives Success" do
    it "returns nil if it receives 'Success'" do
      allow(@board).to receive(:turn) {'Success'}
      expect(subject.play(1,1)).to eq nil
    end

    it "returns the result if it receives Board full - game over" do
      allow(subject).to receive(:exit)
      allow(@board).to receive(:turn) {'Board full - game over'}
      output = 'Board full - game over'
      expect{ subject.play(1,1) }.to output(/#{Regexp.quote(output)}/).to_stdout
    end

    it "returns the result if it receives 'X is the Winner - game over'" do
      allow(subject).to receive(:exit)
      allow(@board).to receive(:turn) {'X is the Winner - game over'}
      output = 'X is the Winner - game over'
      expect{ subject.play(1,1) }.to output(/#{Regexp.quote(output)}/).to_stdout
    end
  end

  context "if game receives 'game over', it calls exit" do
    it "calls exit when it receives 'Board full - game over'" do
      allow(@board).to receive(:turn) {'Board full - game over'}
      expect(subject).to receive(:exit)
      subject.play(1,1)
    end
  end

end
