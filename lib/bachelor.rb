require 'pry'

def get_first_name_of_season_winner(data, air_season)
  winners = []
  data.each do |season, data|
    if season.to_s == air_season
      data.each do |info|
        if info["status"] == "Winner"
          winners << info["name"].gsub(/\s.+/, '')
        end
        end
    end
  end
  winners.join
end


def get_contestant_name(data, occupation)
  data.each do |season, info|
    info.each do |contestant|
      if contestant["occupation"] == occupation
        return contestant["name"]
      end
    end
  end
end

def count_contestants_by_hometown(data, hometown)
  townies = 0
  data.each do |season, info|
    info.each do |contestant|
      if contestant["hometown"] == hometown
        townies += 1
      end
    end
  end
  townies
end

def get_occupation(data, hometown)
  data.each do |season, info|
    info.each do |contestant|
      if contestant["hometown"] == hometown
        return contestant["occupation"]
      end
    end
  end
end

def get_average_age_for_season(data, air_season)
  season_ages = []
  data.each do |season, info|
    if season.to_s == air_season
    info.each do |contestant|
      season_ages << contestant["age"].to_f
    end
    end
  end
  raw_age = season_ages.reduce(:+) / season_ages.size
  raw_age.round
end
