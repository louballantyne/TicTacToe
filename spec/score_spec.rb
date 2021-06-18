require 'score'

describe Score do
  subject{ Score.new('X')}
  context 'a player plays winning moves' do
    it "Player 'x' plays [1,1], [1,2], [1,3]" do
      subject.calc(1,1)
      subject.calc(1,2)
      expect(subject.calc(1,3)).to eq 'X is the Winner - game over'
    end
  end
end
