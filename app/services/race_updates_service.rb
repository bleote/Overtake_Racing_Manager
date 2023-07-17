module RaceUpdatesService
  def self.update_user_stats(race, starting_grid, sorted_race_results)
    user = race.user
    user_team_id = race.team_id

    if race.saved_race == false
      user.user_races += 1
      user.experience = calculate_experience(user.user_races)
      user_race_points = calculate_user_points(sorted_race_results, user_team_id)
      user.user_points += user_race_points
      user.prestige += calculate_user_prestige(user.prestige, user_team_id, user_race_points)

      pole_position = starting_grid.first.driver
      winning_driver = sorted_race_results.first[0]
      second_driver = sorted_race_results.second[0]
      third_driver = sorted_race_results.third[0]

      if race.team_id == pole_position.team_id
        user.user_poles +=1
      end

      if race.team_id == winning_driver.team_id
        user.user_victories += 1
        user.user_podiums += 1
      end

      if race.team_id == second_driver.team_id
        user.user_podiums += 1
      end

      if race.team_id == third_driver.team_id
        user.user_podiums += 1
      end

      user.save
      race.saved_race = true
      race.save
    else
      puts "Race stats already saved!"
    end
  end

  private

  def self.calculate_experience(user_races)
    case user_races
    when 0, 1
      0
    when 2, 3
      1
    when 4, 5
      2
    when 6, 7
      3
    when 8, 9
      4
    when 10, 11
      5
    when 12, 13
      6
    when 14, 15
      7
    when 16, 17
      8
    when 18, 19
      9
    else
      10
    end
  end

  def self.calculate_user_points(sorted_race_results, user_team_id)
    first_driver_points = 0
    second_driver_points = 0

    sorted_race_results.each do |driver, _|
      if driver.team_id == user_team_id
        if first_driver_points.zero?
          first_driver_points = calculate_points(sorted_race_results.index([driver, _]) + 1)
        elsif second_driver_points.zero?
          second_driver_points = calculate_points(sorted_race_results.index([driver, _]) + 1)
        end
      end
    end

    first_driver_points + second_driver_points
  end

  def self.calculate_points(position)
    case position
    when 1
      25
    when 2
      18
    when 3
      15
    when 4
      12
    when 5
      10
    when 6
      8
    when 7
      6
    when 8
      4
    when 9
      2
    when 10
      1
    else
      0
    end
  end

  def self.calculate_user_prestige(user_prestige, user_team_id, user_race_points)
    if user_prestige == 10
      0
    elsif user_prestige == 0
      if [1, 2, 3].include?(user_team_id)
        case user_race_points
        when 33..43
          1
        when 25..32
          0
        else
          0
        end
      elsif [4, 5, 6].include?(user_team_id)
        case user_race_points
        when 33..43
          2
        when 16..32
          1
        when 4..15
          0
        else
          0
        end
      elsif [7, 8, 9, 10].include?(user_team_id)
        case user_race_points
        when 28..43
          3
        when 10..27
          2
        when 1..9
          1
        else
          0
        end
      else
        0
      end
    elsif user_prestige >= 1 || user_prestige <= 9
      if [1, 2, 3].include?(user_team_id)
        case user_race_points
        when 33..43
          1
        when 25..32
          0
        else
          -1
        end
      elsif [4, 5, 6].include?(user_team_id)
        case user_race_points
        when 33..43
          2
        when 16..32
          1
        when 4..15
          0
        else
          -1
        end
      elsif [7, 8, 9, 10].include?(user_team_id)
        case user_race_points
        when 28..43
          3
        when 10..27
          2
        when 1..9
          1
        else
          0
        end
      else
        0
      end
    else
      0
    end
  end
end
