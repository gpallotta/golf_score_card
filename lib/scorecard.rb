class Scorecard
  attr_reader :player, :scores, :hole_layout

  def initialize(player_hash, hole_layout)
    @player = player_hash.keys[0].to_s
    @scores = player_hash.values[0]
    @hole_layout = hole_layout
  end

  def output
    str = "\n"
    str << "==#{player}\n"
    scores.each_with_index do |score, i|
      str << "Hole #{i+1}: #{score} #{term_score(score,hole_layout.holes[i])}\n"
    end
    str << "...\n\nTotal score: #{total_score}\n"
    str << "#{total_score - total_par}\n=="
    str
  end

  def total_score
    scores.inject(:+)
  end

  def total_par
    hole_layout.holes.inject(:+)
  end

  def over_under
    total_score - total_par
  end

  def term_score(score, par)
    return "- Ace" if score == 1
    case score-par
    when -2
      "- Eagle"
    when -1
      "- Birdie"
    when 0
      "- Par"
    when 1
      "- Bogey"
    when 2
      "- Double Bogey"
    when 3
      "- Triple Bogey"
    else
      ""
    end
  end

end
