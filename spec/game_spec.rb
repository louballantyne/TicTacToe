require 'game'

describe Game do
  describe 'turn' do
    it 'allows a player to take a turn' do
      subject.play(1,1)
      expect(subject.board.fields).to include(be_a_kind_of(Field))
    end
  end
end
