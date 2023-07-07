module RaceHelper
  def format_lap_time(milliseconds)
    minutes = (milliseconds / (1000 * 60)).to_i
    seconds = ((milliseconds / 1000) % 60).to_i
    milliseconds_remainder = milliseconds % 1000

    format('%02d:%02d.%03d', minutes, seconds, milliseconds_remainder)
  end

  def chief_message(team_id, sorted_race_results)
    if [1, 2, 3].include?(team_id)
      driver_positions = sorted_race_results.map.with_index { |result, index| [result.first, index + 1] }
      team_driver_positions = driver_positions.select { |driver| driver.first.team_id == team_id }
      if team_driver_positions[0][1] == 1 && team_driver_positions[1][1] <= 3 || team_driver_positions[1][1] == 1 && team_driver_positions[0][1] <= 3
        "This is absolutely brilliant! We dominated the field and no one could be a real match for us today! I must say, I'm impressed!"
      elsif team_driver_positions[0][1] == 1 && team_driver_positions[1][1] > 3 || team_driver_positions[1][1] == 1 && team_driver_positions[0][1] > 3
        "Fantastic! You lead our team to a victory! The top of the podium is where our drivers belong!"
      elsif (team_driver_positions[0][1] && team_driver_positions[1][1] <= 3) && (team_driver_positions[0][1] && team_driver_positions[1][1] > 1)
        "Great job! A double podium for the team is a strong message to our rivals. Let's keep pushing and the victory will come for sure!"
      elsif team_driver_positions[0][1] <= 3 && team_driver_positions[0][1] > 1 && team_driver_positions[1][1] > 3 || team_driver_positions[1][1] <= 3 && team_driver_positions[1][1] > 1 && team_driver_positions[0][1] > 3
        "Well done! We got a podium and scored some good points! There were some opportunities left on the table, but we should be able to get it all next time. Let's discuss this during the week."
      else
        "Tough race today. Our competitors seem to be more efficient with their work. Maybe it was just a bad day, but this isn't where we want to be. We need more!"
      end
    elsif [4, 5, 6].include?(team_id)
      driver_positions = sorted_race_results.map.with_index { |result, index| [result.first, index + 1] }
      team_driver_positions = driver_positions.select { |driver| driver.first.team_id == team_id }
      if team_driver_positions[0][1] == 1 || team_driver_positions[1][1] == 1
        "OH YES!!! Absolute mega job today! No one could see that coming and we smashed everyone's expectations! Let's go!"
      elsif team_driver_positions[0][1] && team_driver_positions[1][1] <= 3 && team_driver_positions[0][1] && team_driver_positions[1][1] > 1
        "My goodness! A double podium for our team feels like a dream! Let's make sure we celebrate as hard as we work during tonight's team party!"
      elsif team_driver_positions[0][1] <= 3 && team_driver_positions[0][1] > 1 && team_driver_positions[1][1] > 3 || team_driver_positions[1][1] <= 3 && team_driver_positions[1][1] > 1 && team_driver_positions[0][1] > 3
        "Fantastic job! Reaching the podium with our car, against stronger competitors, definitely hits like a victory!"
      elsif team_driver_positions[0][1] <= 10 && team_driver_positions[0][1] > 3 && team_driver_positions[1][1] <= 10 && team_driver_positions[1][1] > 3 &&
        "Great job! Consistently scoring with both cars is exactly what we need to be the reference against our direct competitors."
      elsif team_driver_positions[0][1] <= 10 && team_driver_positions[0][1] > 3 && team_driver_positions[1][1] > 10 || team_driver_positions[1][1] <= 10 && team_driver_positions[1][1] > 3 && team_driver_positions[0][1] > 10
        "Well.. that's a wrap! A driver in the top 10 is the positive part, but we need to make sure both our cars are equally competitive!"
      else
        "That was a tough one. Being out of the points with both of our cars isn't what we're looking for. Let's make sure next time we capitalize on our opportunities."
      end
    else
      "Keep up the good work!"
    end
  end

  def calculate_points(position)
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
end
