class Race < ApplicationRecord
  attr_accessor :car_adjustments

  belongs_to :user
  belongs_to :circuit
  belongs_to :team
  belongs_to :team_a, class_name: 'Team'
  belongs_to :team_b, class_name: 'Team'
  belongs_to :team_c, class_name: 'Team'
  belongs_to :team_d, class_name: 'Team'
  belongs_to :team_e, class_name: 'Team'
  belongs_to :team_f, class_name: 'Team'
  belongs_to :team_g, class_name: 'Team'
  belongs_to :team_h, class_name: 'Team'
  belongs_to :team_i, class_name: 'Team'
  belongs_to :team_j, class_name: 'Team'

  after_initialize :set_team_defaults
  after_initialize :set_weather
  after_initialize :set_status

  def lap_time(team_id, driver, car, circuit, ideal_lap_time, race)
    driver_adjustment = driver_adjustment(driver)
    car_adjustment = car_adjustment(team_id, car, circuit, race)
    ideal_lap_time + driver_adjustment + car_adjustment
  end

  def calculate_lap_times_for_q1
    all_20_drivers = Driver.limit(20)
    q1_lap_times = lap_times_iteration(all_20_drivers, self)
    @q1 = q1_lap_times.sort_by(&:time)
  end

  def calculate_lap_times_for_q2
    top_15_q1_lap_times = @q1.first(15)
    q2_lap_times = lap_times_iteration(top_15_q1_lap_times, self)
    @q2 = q2_lap_times.sort_by(&:time)
  end

  def calculate_lap_times_for_q3
    top_10_q2_lap_times = @q2.first(10)
    q3_lap_times = lap_times_iteration(top_10_q2_lap_times, self)
    @q3 = q3_lap_times.sort_by(&:time)
  end

  def lap_times_iteration(session_lap_times, race)
    if session_lap_times == Driver.limit(20)
      Rails.cache.fetch("lap_times_#{race.id}_#{session_lap_times.to_param}", expires_in: 3.days) do
        session_lap_times.map do |driver|
          car = driver.car
          circuit = self.circuit
          ideal_lap_time = circuit.ideal_lap_time
          team_id = driver.team_id
          lap_time_session = lap_time(team_id, driver, car, circuit, ideal_lap_time, race)
          LapTime.new(driver: driver, time: lap_time_session)
        end
      end
    else
      Rails.cache.fetch("lap_times_#{race.id}_#{session_lap_times.to_param}", expires_in: 3.days) do
        session_lap_times.map do |lap_time|
          driver = lap_time.driver
          car = driver.car
          circuit = self.circuit
          ideal_lap_time = circuit.ideal_lap_time
          team_id = driver.team_id
          lap_time_session = lap_time(team_id, driver, car, circuit, ideal_lap_time, race)
          LapTime.new(driver: driver, time: lap_time_session)
        end
      end
    end
  end

  def calculate_race_laps(race, starting_grid)
    driver_lap_times = {}
    total_laps = self.circuit.total_laps

    total_laps.times do |lap_number|
      starting_grid.each_with_index do |lap_time, index|
        driver = lap_time.driver
        car = driver.car
        circuit = self.circuit
        ideal_lap_time = circuit.ideal_lap_time
        team_id = driver.team_id

        lap_time_race = lap_time(team_id, driver, car, circuit, ideal_lap_time, race)

        if lap_number.zero?
          time_penalty = index * 250
          lap_time_race += time_penalty
        end

        # Add the current lap time to the driver's total race time
        driver_lap_times[driver] ||= []
        driver_lap_times[driver] << { lap_time: lap_time_race }

        race.lap_number = lap_number + 1
      end
    end

    race.save

    driver_lap_times
  end

  private

  def driver_adjustment(driver)
    proficiency_variations = [rand(0..100), rand(0..200), rand(0..300), rand(0..400)]
    randomize_proficiency = rand(0..3)
    driver_proficiency = proficiency_variations[randomize_proficiency]
    driving_skills_adjustment = (11 - driver.driving_skills) * driver_proficiency
    fitness_level_adjustment = (11 - driver.fitness_level) * rand(0..50)
    wet_race_adjustment = self.weather == 'Rainny' ? (11 - driver.wet_race) * rand(0..400) + ((self.circuit.ideal_lap_time / 100) * 21) : 0
    driver_error_variations = [0, 0, 0, 0, 150, 150, 300, 300, 500, 500]
    randomize_proficiency = rand(0..3)
    driver_errors = driver_error_variations[randomize_proficiency]

    driving_skills_adjustment + fitness_level_adjustment + driver_errors + wet_race_adjustment
  end

  def car_adjustment(team_id, car, circuit, race)
    self.car_adjustments ||= {}

    puts "self.car_adjustments: #{self.car_adjustments}"

    if car_adjustments[car.id].nil?
      gearbox_adjustments = (9.9 - car.gearbox) * circuit_characteristics(circuit) * 1 / 30
      suspension_adjustments = (9.9 - car.suspension) * circuit_characteristics(circuit) * 1 / 30
      downforce_adjustments = (9.9 - car.downforce) * circuit_characteristics(circuit) * 2 / 30
      aero_setups ||= aero_setups(team_id, car, circuit, race)

      car_adjustments[car.id] = gearbox_adjustments + suspension_adjustments + downforce_adjustments + aero_setups
    end

    car_adjustments[car.id]
  end

  def aero_setups(team_id, car, circuit, race)
    if car.team_id != race.team_id
      car.aero_setup = circuit.ideal_aero_setup
      car.save
      aero_setup_variation = [0, 0, 0, 10000]
      randomize_aero = rand(0..3)
      opponent_aero_setup ||= aero_setup_variation[randomize_aero]
    else
      calculate_aero_setup_mistake(team_id, car, circuit, race)
    end
  end

  def calculate_aero_setup_mistake(team_id, car, circuit, race)
    ideal_aero_setup = circuit.ideal_aero_setup

    if car.team_id == race.team_id
      case ideal_aero_setup
      when 'Maximum downforce'
        case car.aero_setup
        when 'Maximum downforce'
          0
        when 'Cornering'
          100
        when 'Balanced'
          200
        when 'Straights'
          300
        when 'Minimum downforce'
          400
        else
          0
        end
      when 'Cornering'
        case car.aero_setup
        when 'Maximum downforce'
          100
        when 'Cornering'
          0
        when 'Balanced'
          100
        when 'Straights'
          200
        when 'Minimum downforce'
          300
        else
          0
        end
      when 'Balanced'
        case car.aero_setup
        when 'Maximum downforce'
          200
        when 'Cornering'
          100
        when 'Balanced'
          0
        when 'Straights'
          100
        when 'Minimum downforce'
          200
        else
          0
        end
      when 'Straights'
        case car.aero_setup
        when 'Maximum downforce'
          300
        when 'Cornering'
          200
        when 'Balanced'
          100
        when 'Straights'
          0
        when 'Minimum downforce'
          100
        else
          0
        end
      when 'Minimum downforce'
        case car.aero_setup
        when 'Maximum downforce'
          400
        when 'Cornering'
          300
        when 'Balanced'
          200
        when 'Straights'
          100
        when 'Minimum downforce'
          0
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

  def circuit_characteristics(circuit)
    @circuit_characteristics ||= circuit_corners(circuit) + circuit_straights(circuit)
  end

  def circuit_corners(circuit)
    total_corner_time ||= (circuit.slow_corners * 30) + (circuit.medium_corners * 20) + (circuit.fast_corners * 10)
  end

  def circuit_straights(circuit)
    total_straight_time ||= (circuit.short_straights * 30) + (circuit.medium_straights * 40) + (circuit.long_straights * 60)
  end

  def set_team_defaults
    self.team_a_id = Team.find(1).id
    self.team_b_id = Team.find(2).id
    self.team_c_id = Team.find(3).id
    self.team_d_id = Team.find(4).id
    self.team_e_id = Team.find(5).id
    self.team_f_id = Team.find(6).id
    self.team_g_id = Team.find(7).id
    self.team_h_id = Team.find(8).id
    self.team_i_id = Team.find(9).id
    self.team_j_id = Team.find(10).id
  end

  def set_weather
    self.weather
    if self.weather.nil?
      weather_variations = ['Sunny', 'Cloudy', 'Rainny', 'Sunny', 'Cloudy', 'Light Rain']
      randomize_weather = rand(0..5)
      weather = weather_variations[randomize_weather]
      self.weather = weather
    else
      self.weather
    end
  end

  def set_status
    self.status = 'Not Started'
  end
end
