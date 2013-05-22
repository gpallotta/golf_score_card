require 'csv'

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

  def scorecard_array
    arr = []
    CSV.foreach(@file) do |line|
      name = "#{line[1]} #{line[0]}".strip
      line.shift(2)
      line.map! { |elem| elem.to_i }
      arr.push({name.to_sym => line})
    end
    arr
  end

end
