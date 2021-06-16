require 'game'

describe Game do
  describe 'turn' do
    it 'allows a player to take a turn' do
      subject.play(1,1)
      expect(subject.board.fields).to include(be_a_kind_of(Field))
    end
  end

  context 'the players are alternated from one turn to the next' do
    it 'has a first turn of player X, then a second turn of player O' do
      subject.play(1,1)
      expect(subject.board.fields.last.player).to eq("X")
      subject.play(2,1)
      expect(subject.board.fields.last.player).to eq("O")
    end
  end
end
