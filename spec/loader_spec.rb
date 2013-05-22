require_relative '../lib/loader'

describe Loader do

  describe "hole_array method" do
    let(:l) { Loader.new("spec/hole_layout_seed.csv") }

    it "returns an array" do
      expect(l.hole_array).to be_an(Array)
    end

    it "populates the array with data from the file" do
      test_arr = [3,4,5,3,4,5,3,4,5,3,4,5,3,4,5,3,4,5]
      expect(l.hole_array).to eql(test_arr)
    end
  end

  describe "scorecard method" do
    let(:l) { Loader.new("spec/scorecard_seed.csv") }
    it "returns an array" do
      expect(l.scorecard_array).to be_an(Array)
    end

    it "returns an array of players and scores" do
      player = {:'Tiger Woods' => [3,4,5,3,4,5,3,4,5,3,4,5,3,4,5,3,4,5] }
      expect(l.scorecard_array[0]).to eql(player)
    end
  end

end
