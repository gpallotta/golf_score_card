require_relative '../lib/scorecard.rb'
require_relative '../lib/hole_layout.rb'
require_relative '../lib/loader.rb'
require_relative '../lib/leaderboard.rb'

describe LeaderBoard do

  let(:l)  { Loader.new("spec/hole_layout_seed.csv") }
  let(:hl) { HoleLayout.new(l.hole_array) }
  let(:player) { {:'Tiger Woods' => [3,4,5,3,4,5,3,4,5,3,4,5,3,4,5,3,4,5] } }
  let(:player2) { {:'William Wonka' => [3,4,5,3,4,5,3,4,5,3,4,5,3,4,5,3,4,4] } }
  let(:scorecard) { Scorecard.new(player, hl) }
  let(:scorecard2) { Scorecard.new(player2, hl) }
  let(:lb) { LeaderBoard.new }

  before(:each) do
     lb.accumulate_scorecards(scorecard)
     lb.accumulate_scorecards(scorecard2)
   end

  describe "scorecards array" do
    it "has a list of scorecards" do
      expect(lb.scorecards).to be_an(Array)
    end
    it "adds the scorecard to the array" do
      expect(lb.scorecards[0]).to eql(scorecard)
    end
  end

  describe "printing scorecards" do

    it "gets the players name" do
      expect(lb.output_scorecards).to include(scorecard.player)
    end

    it "has the player's scores" do
      expect(scorecard.output).to include("Hole 1: 3 - Par")
    end

    it "has the total score, under and over" do
      expect(scorecard.output).to include("72\n0")
    end

  end

  describe "order_players" do
    it "orders the players based on asscending score differential" do
      lb.order_players
      expect(lb.scorecards[0]).to eql(scorecard2)
    end
  end

  describe "output_leaderboard" do
    it "contains the player's over/under" do
      expect(lb.output_leaderboard).to include(scorecard2.over_under.to_s)
    end
    it "contains the player's total score" do
      expect(lb.output_leaderboard).to include(scorecard2.total_score.to_s)
    end
    it "contains the player's full name" do
      expect(lb.output_leaderboard).to include(scorecard2.player)
    end
  end

end
