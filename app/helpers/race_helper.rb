module RaceHelper
  def format_lap_time(milliseconds)
    minutes = (milliseconds / (1000 * 60)).to_i
    seconds = ((milliseconds / 1000) % 60).to_i
    milliseconds_remainder = milliseconds % 1000

    format('%02d:%02d.%03d', minutes, seconds, milliseconds_remainder)
  end
end
