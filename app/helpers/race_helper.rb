module RaceHelper
  def format_lap_time(milliseconds)
    minutes = (milliseconds / (1000 * 60)).to_i
    seconds = ((milliseconds / 1000) % 60).to_i
    milliseconds_remainder = milliseconds % 1000

    format('%02d:%02d.%03d', minutes, seconds, milliseconds_remainder)
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
