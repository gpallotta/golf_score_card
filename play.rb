require_relative 'lib/scorecard.rb'
require_relative 'lib/hole_layout.rb'
require_relative 'lib/loader.rb'
require_relative 'lib/leaderboard.rb'

l = Loader.new("spec/hole_layout_seed.csv")
hl = HoleLayout.new(l.hole_array)
tw = {:'Tiger Woods' => [3,4,5,3,4,5,3,4,5,3,4,5,3,4,5,3,4,5] }
ww = {:'William Wonka' => [3,4,5,3,4,5,3,4,5,3,4,5,3,4,5,3,4,4] }
sc1 = Scorecard.new(tw, hl)
sc2 = Scorecard.new(ww, hl)
lb = LeaderBoard.new
lb.accumulate_scorecards(sc1)
lb.accumulate_scorecards(sc2)

puts lb.output_scorecards
puts lb.output_leaderboard
