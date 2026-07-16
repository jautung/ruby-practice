module Tournament
  module Result
    WIN = "WIN"
    LOSS = "LOSS"
    DRAW = "DRAW"
  end

  Match = Data.define(:team1, :team2, :result)
  TeamStats = Data.define(:name, :matches_played, :wins, :draws, :losses, :points)

  def self.tally(inp)
    raw_matches = inp.split("\n")
    parsed_matches = raw_matches.map { |m| Tournament.parse_match(m) }
    all_teams = Tournament.get_all_teams(parsed_matches)
    all_team_stats = all_teams.map { |t| Tournament.get_team_stats(t, parsed_matches) }.sort_by { |t| [-t.points, t.name] }
    Tournament.format_all_team_stats(all_team_stats)
  end

  def self.parse_match(raw_match)
    parts = raw_match.split(";")
    if parts.length != 3
      raise
    end
    Match.new(parts[0], parts[1], Tournament.parse_result(parts[2]))
  end

  def self.parse_result(raw_result)
    case raw_result
      when "win" then Result::WIN
      when "loss" then Result::LOSS
      when "draw" then Result::DRAW
      else raise
    end
  end

  def self.get_all_teams(matches)
    all_teams = Set.new
    matches.each do |m| 
      all_teams.add(m.team1)
      all_teams.add(m.team2)
    end
    all_teams
  end

  def self.get_team_stats(team, matches)
    matches_played = 0
    wins = 0
    draws = 0
    losses = 0
    points = 0
    matches.each do |match|
      if match.team1 == team
        matches_played += 1
        case match.result
          when Result::WIN
            wins += 1
            points += 3
          when Result::LOSS
            losses += 1
          when Result::DRAW
            draws += 1
            points += 1
        end
      end
      if match.team2 == team
        matches_played += 1
        case match.result
          when Result::WIN
            losses += 1
          when Result::LOSS
            wins += 1
            points += 3
          when Result::DRAW
            draws += 1
            points += 1
        end
      end
    end
    TeamStats.new(team, matches_played, wins, draws, losses, points)
  end

  def self.format_all_team_stats(all_team_stats)
    rows = []
    rows.push(["Team", "MP", "W", "D", "L", "P"])
    all_team_stats.each do |team_stat|
      rows.push([
        team_stat.name,
        team_stat.matches_played,
        team_stat.wins,
        team_stat.draws,
        team_stat.losses,
        team_stat.points
      ])
    end
    formatted_rows = rows.map do |row|
      padded_row = row.map.with_index do |element, index|
        index == 0 ? element.to_s.ljust(30) : element.to_s.rjust(2)
      end
      padded_row.join(" | ")
    end
    formatted_rows.join("\n") + "\n"
  end
end

input = <<~INPUT
  Allegoric Alaskans;Blithering Badgers;win
INPUT
puts Tournament.tally(input)

input = <<~INPUT
  Allegoric Alaskans;Blithering Badgers;win
  Blithering Badgers;Courageous Californians;win
  Courageous Californians;Allegoric Alaskans;loss
INPUT
puts Tournament.tally(input)

input = <<~INPUT
  Courageous Californians;Devastating Donkeys;win
  Allegoric Alaskans;Blithering Badgers;win
  Devastating Donkeys;Allegoric Alaskans;loss
  Courageous Californians;Blithering Badgers;win
  Blithering Badgers;Devastating Donkeys;draw
  Allegoric Alaskans;Courageous Californians;draw
INPUT
puts Tournament.tally(input)