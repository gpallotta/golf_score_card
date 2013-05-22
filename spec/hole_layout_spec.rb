require_relative '../lib/hole_layout'

describe HoleLayout do

  let(:l)  { Loader.new("spec/test_seed.csv") }
  let(:hl) { HoleLayout.new(l.hole_array) }

  it "has holes" do
    expect(hl.holes).to be_an(Array)
  end

  it "has the correct holes" do
    test_arr = [3,4,5,3,4,5,3,4,5,3,4,5,3,4,5,3,4,5]
    expect(hl.holes).to eql(test_arr)
  end

end

describe Loader do

  describe "hole_array method" do
    let(:l) { Loader.new("spec/test_seed.csv") }

    it "returns an array" do
      expect(l.hole_array).to be_an(Array)
    end

    it "populates the array with data from the file" do
      test_arr = [3,4,5,3,4,5,3,4,5,3,4,5,3,4,5,3,4,5]
      expect(l.hole_array).to eql(test_arr)
    end
  end

end
