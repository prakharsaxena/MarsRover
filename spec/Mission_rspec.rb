require './game'



describe Game do
  describe "#score" do
    it "returns 0 for all gutter game" do
      game = Game.new
      20.times { game.roll(0) }
      game.score.should == 0
    end
    it "returns 1 when you knock over 1 pin" do
      game = Game.new
      20.times { game.roll(1)}
      game.score.should == 1
    end
    context "in frame 2" do
      it "returns same score and sumber of pins" do
        game = Game.new
        20.times {game.roll(1)}
        game.score.should == 1
      end
    end
  end
end