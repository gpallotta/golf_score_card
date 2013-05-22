require 'csv'

class HoleLayout
  attr_reader :holes

  def initialize(hole_array)
    @holes = hole_array
  end

end

class Loader

  def initialize(file)
    @file = file
  end

  def hole_array
    arr = []
    CSV.foreach(@file) do |line|
      arr = line
    end
    arr.map { |elem| elem.to_i }
  end

end
