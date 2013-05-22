require_relative '../lib/hole_layout'

describe HoleLayout do

  let(:l)  { Loader.new("spec/hole_layout_seed.csv") }
  let(:hl) { HoleLayout.new(l.hole_array) }

  it "has holes" do
    expect(hl.holes).to be_an(Array)
  end

  it "has the correct holes" do
    test_arr = [3,4,5,3,4,5,3,4,5,3,4,5,3,4,5,3,4,5]
    expect(hl.holes).to eql(test_arr)
  end

end

