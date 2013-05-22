require_relative '../lib/scorecard.rb'
require_relative '../lib/hole_layout.rb'
require_relative '../lib/loader.rb'

describe Scorecard do
  let(:l)  { Loader.new("spec/hole_layout_seed.csv") }
  let(:hl) { HoleLayout.new(l.hole_array) }
  let(:player) { {:'Tiger Woods' => [3,4,5,3,4,5,3,4,5,3,4,5,3,4,5,3,4,5] } }
  let(:scorecard) { Scorecard.new(player, hl) }

  it "has a player" do
    expect(scorecard.player).to eql(player.keys[0].to_s)
  end

  it "has a score" do
    expect(scorecard.scores).to eql(player.values[0])
  end

  it "has a hole layout" do
    expect(scorecard.hole_layout).to be_a(HoleLayout)
  end

  describe 'output method' do
    it "has the player's name" do
      expect(scorecard.output).to include(player.keys[0].to_s)
    end

    it "has the player's scores" do
      expect(scorecard.output).to include("Hole 1: 3 - Par")
    end

    it "has the total score, under and over" do
      expect(scorecard.output).to include("72\n0")
    end

  end

  describe 'term_score method' do
    it "should return par" do
      expect(scorecard.term_score(2,2)).to eql('- Par')
    end

    it "should return birdie" do
      expect(scorecard.term_score(2,3)).to eql('- Birdie')
    end

    it "should return bogey" do
      expect(scorecard.term_score(3,2)).to eql('- Bogey')
    end

  end
end
    # l = Loader.new('scorecard_seed.csv')
    # l.scorecard_array.each do |player|
    #   s = Scorecard.new()
