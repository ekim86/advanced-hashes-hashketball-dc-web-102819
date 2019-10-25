# Write your code here!
def game_hash
  {
    :home => {
      :team_name => "Brooklyn Nets",
      :colors => ["Black", "White"],
      :players => [
        {
          :player_name => "Alan Anderson",
          :number => 0,
          :shoe => 16,
          :points => 22,
          :rebounds => 12,
          :assists => 12,
          :steals => 3,
          :blocks => 1,
          :slam_dunks => 1
        },
        {
          :player_name => "Reggie Evans",
          :number => 30,
          :shoe => 14,
          :points => 12,
          :rebounds => 12,
          :assists => 12,
          :steals => 12,
          :blocks => 12,
          :slam_dunks => 7
        },
        {
          :player_name => "Brook Lopez",
          :number => 11,
          :shoe => 17,
          :points => 17,
          :rebounds => 19,
          :assists => 10,
          :steals => 3,
          :blocks => 1,
          :slam_dunks => 15
        },
        {
          :player_name => "Mason Plumlee",
          :number => 1,
          :shoe => 19,
          :points => 26,
          :rebounds => 11,
          :assists => 6,
          :steals => 3,
          :blocks => 8,
          :slam_dunks => 5
        },
        {
          :player_name => "Jason Terry",
          :number => 31,
          :shoe => 15,
          :points => 19,
          :rebounds => 2,
          :assists => 2,
          :steals => 4,
          :blocks => 11,
          :slam_dunks => 1
        }
      ]
    },
    :away => {
      :team_name => "Charlotte Hornets",
      :colors => ["Turquoise", "Purple"],
      :players => [
        {
          :player_name => "Jeff Adrien",
          :number => 4,
          :shoe => 18,
          :points => 10,
          :rebounds => 1,
          :assists => 1,
          :steals => 2,
          :blocks => 7,
          :slam_dunks => 2
        },
        {
          :player_name => "Bismack Biyombo",
          :number => 0,
          :shoe => 16,
          :points => 12,
          :rebounds => 4,
          :assists => 7,
          :steals => 22,
          :blocks => 15,
          :slam_dunks => 10
        },
        {
          :player_name => "DeSagna Diop",
          :number => 2,
          :shoe => 14,
          :points => 24,
          :rebounds => 12,
          :assists => 12,
          :steals => 4,
          :blocks => 5,
          :slam_dunks => 5
        },
        {
          :player_name => "Ben Gordon",
          :number => 8,
          :shoe => 15,
          :points => 33,
          :rebounds => 3,
          :assists => 2,
          :steals => 1,
          :blocks => 1,
          :slam_dunks => 0
        },
        {
          :player_name => "Kemba Walker",
          :number => 33,
          :shoe => 15,
          :points => 6,
          :rebounds => 12,
          :assists => 12,
          :steals => 7,
          :blocks => 5,
          :slam_dunks => 12
        }
      ]
    }
  }
end

def num_points_scored(player_name)
  player_stats(player_name)[:points]
end

def shoe_size(player_name)
  player_stats(player_name)[:shoe]
end

def team_colors(team_name)
  team_info(team_name)[:colors]
end

def team_names
  game_hash.map do |location, team_data|
    team_data[:team_name]
  end
end

def player_numbers(team_name)
  team_info(team_name)[:players].map do |player|
    player_stats(player[:player_name])[:number]
  end
end

def big_shoe_rebounds
  shoe_size = 0
  rebounds = 0
  game_hash.each do |location, team_data|
    team_data[:players].each do |player_data|
      if player_data[:shoe] > shoe_size
        shoe_size = player_data[:shoe]
        rebounds = player_data[:rebounds]
      end
    end
  end
  rebounds
end

def most_points_scored
  score = 0
  player = ""
  game_hash.each do |location, team_data|
    team_data[:players].each do |player_data|
      if player_data[:points] > score
        score = player_data[:points]
        player = player_data[:player_name]
      end
    end
  end
  player
end

def winning_team
  score = {}
  game_hash.each do |location, team_data|
    score[team_data[:team_name]] = 0
    team_data[:players].each do |player_data|
      score[team_data[:team_name]] += player_data[:points]
    end
  end
  
  score.key(score.values.max)
end

def player_with_longest_name
  name_length = 0
  player = ""
  game_hash.each do |location, team_data|
    team_data[:players].each do |player_data|
      if player_data[:player_name].length > name_length
        name_length = player_data[:player_name].length
        player = player_data[:player_name]
      end
    end
  end
  player
end

def long_name_steals_a_ton?
  steals = 0
  player = ""
  game_hash.each do |location, team_data|
    team_data[:players].each do |player_data|
      if player_data[:steals] > steals
        steals = player_data[:steals]
        player = player_data[:player_name]
      end
    end
  end
  
  player == player_with_longest_name
end

def player_stats(player)
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :players
        data.each do |data_item|
          if data_item[:player_name] == player
            data_item.delete(:player_name)
            return data_item
          end
        end
      end
    end
  end
end

def team_info(team_name)
  game_hash.each do |location, team_data|
    if team_data[:team_name] == team_name
      return team_data
    end
  end
end








