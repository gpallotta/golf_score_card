class LeaderBoard
  attr_accessor :scorecards

  def initialize
    @scorecards = []
  end

  def accumulate_scorecards(scorecard)
    @scorecards << scorecard
  end

  def output_scorecards
    bfs = '' # big frickin string
    @scorecards.each do |s|
      bfs << s.output
    end
    bfs
  end

  def order_players
    @scorecards.sort_by! { |s| s.over_under }
  end

  def output_leaderboard
    order_players
    str = "\n"
    @scorecards.each do |s|
      str << "#{s.over_under} "
      str << "#{s.total_score} "
      str << "#{s.player}\n"
    end
    str
  end

end
