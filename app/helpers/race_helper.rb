module RaceHelper
  def check_race_session(race_status)
    @session = race_status
  end

  def check_track_temperature(race_weather)
    case race_weather
    when 'Sunny'
      rand(30..45)
    when 'Cloudy'
      rand(20..30)
    when 'Light Rain'
      rand(15..20)
    else
      rand(10..15)
    end
  end

  def set_tyres(race_weather)
    case race_weather
    when 'Light Rain'
      'Intermediates'
    when 'Rainy'
      'Wets'
    else
      'Softs'
    end
  end

  def format_lap_time(milliseconds)
    minutes = (milliseconds / (1000 * 60)).to_i
    seconds = ((milliseconds / 1000) % 60).to_i
    milliseconds_remainder = milliseconds % 1000

    format('%02d:%02d.%03d', minutes, seconds, milliseconds_remainder)
  end

  def chief_race_message(team_id, sorted_race_results)
    if [1, 2, 3].include?(team_id)
      frontrunners(team_id, sorted_race_results)
    elsif [4, 5, 6].include?(team_id)
      midfielders(team_id, sorted_race_results)
    elsif [7, 8, 9, 10].include?(team_id)
      backmarkers(team_id, sorted_race_results)
    else
      "Keep up the good work!"
    end
  end

  private

  def frontrunners(team_id, sorted_race_results)
    driver_positions = sorted_race_results.map.with_index { |result, index| [result.first, index + 1] }
    team_driver_positions = driver_positions.select { |driver| driver.first.team_id == team_id }
    if team_driver_positions[0][1] == 1 && team_driver_positions[1][1] <= 3 || team_driver_positions[1][1] == 1 && team_driver_positions[0][1] <= 3
      "This is absolutely brilliant! We dominated the field and no one could be a real match for us today! I must say, I'm impressed!"
    elsif team_driver_positions[0][1] == 1 && (team_driver_positions[1][1] > 3 && team_driver_positions[1][1] <= 10) || team_driver_positions[1][1] == 1 && (team_driver_positions[0][1] > 3 && team_driver_positions[0][1] <= 10)
      "Fantastic! You lead our team to a victory! The top of the podium is where our drivers belong! Next race we can do it again!"
    elsif team_driver_positions[0][1] == 1 && team_driver_positions[1][1] > 10 || team_driver_positions[1][1] == 1 && team_driver_positions[0][1] > 10
      "Let's celebrate our victory today! Well deserved. At the same time, we can't afford having a car out of the points. We need both drivers fighting in the front."
    elsif (team_driver_positions[0][1] && team_driver_positions[1][1] <= 3) && (team_driver_positions[0][1] && team_driver_positions[1][1] > 1)
      "Great job! A double podium for the team is a strong message to our rivals. Let's keep pushing and the victory will come for sure!"
    elsif (team_driver_positions[0][1] <= 3 && team_driver_positions[0][1] > 1) && (team_driver_positions[1][1] > 3 && team_driver_positions[1][1] <= 10) || (team_driver_positions[1][1] <= 3 && team_driver_positions[1][1] > 1) && (team_driver_positions[0][1] > 3 && team_driver_positions[0][1] <= 10)
      "Well done! We got a podium and scored some good points! There were some opportunities left on the table, but we should be able to get it all next time. Let's discuss this during the week."
    elsif (team_driver_positions[0][1] <= 3 && team_driver_positions[0][1] > 1) && team_driver_positions[1][1] > 10 || (team_driver_positions[1][1] <= 3 && team_driver_positions[1][1] > 1) && team_driver_positions[0][1] > 10
      "We have some mixed feelings today. We can be happy for the podium for sure, but we need to understand why the other car was so far behind. We can't be a team that's only half competitive."
    else
      "Tough race today. Our competitors seem to be more efficient with their work. Maybe it was just a bad day, but this isn't where we want to be. We need more!"
    end
  end

  def midfielders(team_id, sorted_race_results)
    driver_positions = sorted_race_results.map.with_index { |result, index| [result.first, index + 1] }
    team_driver_positions = driver_positions.select { |driver| driver.first.team_id == team_id }
    if team_driver_positions[0][1] == 1 || team_driver_positions[1][1] == 1
      "Absolute mega job today! A victory that no one could see it coming and we smashed everyone's expectations! Let's go!"
    elsif (team_driver_positions[0][1] && team_driver_positions[1][1] <= 3) && (team_driver_positions[0][1] && team_driver_positions[1][1] > 1)
      "A double podium for our team feels like a dream! Let's make sure we celebrate as hard as we work during tonight's team party!"
    elsif (team_driver_positions[0][1] <= 3 && team_driver_positions[0][1] > 1) && team_driver_positions[1][1] > 3 || team_driver_positions[1][1] <= 3 && team_driver_positions[1][1] > 1 && team_driver_positions[0][1] > 3
      "Fantastic job! Reaching the podium with our car, against stronger competitors, definitely hits like a victory!"
    elsif (team_driver_positions[0][1] > 3 && team_driver_positions[0][1] <= 10) && (team_driver_positions[1][1] > 3 && team_driver_positions[1][1] <= 10)
      "Great job! Consistently scoring with both cars is exactly what we need to be the reference against our direct competitors."
    elsif (team_driver_positions[0][1] > 3 && team_driver_positions[0][1] <= 10) && team_driver_positions[1][1] > 10 || (team_driver_positions[1][1] > 3 && team_driver_positions[1][1] <= 10) && team_driver_positions[0][1] > 10
      "Well.. that's a wrap! A driver in the top 10 is the positive part, but we need to make sure both our cars are equally competitive!"
    else
      "That was a tough one. Being out of the points with both of our cars isn't what we're looking for. Let's make sure next time we capitalize on our opportunities."
    end
  end

  def backmarkers(team_id, sorted_race_results)
    driver_positions = sorted_race_results.map.with_index { |result, index| [result.first, index + 1] }
    team_driver_positions = driver_positions.select { |driver| driver.first.team_id == team_id }
    if team_driver_positions[0][1] == 1 || team_driver_positions[1][1] == 1
      "That was absolutely incredible! A victory for our team is beyond imagination, and you were brilliant! This one goes to the books!"
    elsif (team_driver_positions[0][1] && team_driver_positions[1][1] <= 3) && (team_driver_positions[0][1] && team_driver_positions[1][1] > 1)
      "They say lightning doesn't strike twice in the same spot, but you redefined that quote! A double podium is our race miracle!"
    elsif (team_driver_positions[0][1] > 1 && team_driver_positions[0][1] <= 3) && team_driver_positions[1][1] > 3 || (team_driver_positions[1][1] > 1 && team_driver_positions[1][1] <= 3) && team_driver_positions[0][1] > 3
      "Unbelievable job! I have no words to describe how impressed I am right now! you've put our team in the direction we wished for so long!"
    elsif (team_driver_positions[0][1] > 3 && team_driver_positions[0][1] <= 10) && (team_driver_positions[1][1] > 3 && team_driver_positions[1][1] <= 10)
      "What a  fantastic job! Both of our cars in the mix, fighting hard and achieving points is the maximum we could ask for! Well done!"
    elsif (team_driver_positions[0][1] > 3 && team_driver_positions[0][1] <= 10) && team_driver_positions[1][1] > 10 || (team_driver_positions[1][1] > 3 && team_driver_positions[1][1] <= 10) && team_driver_positions[0][1] > 10
      "Great job! A driver in the top 10 is the boost of energy we were needing to prove to everyone that we're progressing! Let's keep pushing!"
    elsif (team_driver_positions[0][1] > 10 && team_driver_positions[0][1] <= 15) && (team_driver_positions[1][1] > 10 && team_driver_positions[1][1] <= 15)
      "Well done! we know we can't expect too much, but we still had both cars finishing close to the top 10. With some luck, points might come on the next time."
    elsif (team_driver_positions[0][1] > 10 && team_driver_positions[0][1] <= 15) && team_driver_positions[1][1] > 15 || (team_driver_positions[1][1] > 10 && team_driver_positions[1][1] <= 15) && team_driver_positions[0][1] > 15
      "That's it for today! One of our cars was more in the mix, but the other was not so much. We need some adjustments if we want to have any real chance of scoring in the future."
    else
      "Tough day at the office huh?! Well... we know the odds are against us, but we need overall improvements to be fighting in the midfield."
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
