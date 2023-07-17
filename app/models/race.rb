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

  def calculate_lap_times_for_q1(race)
    drivers = Driver.all.limit(20)
    q1_lap_times = []

    drivers.each do |driver|
      car = driver.car
      circuit = self.circuit
      ideal_lap_time = circuit.ideal_lap_time
      team_id = driver.team_id

      lap_time_q1 = lap_time(team_id, driver, car, circuit, ideal_lap_time, race) + 1500

      q1_lap_times << LapTime.new(driver: driver, time: lap_time_q1)
    end

    @q1 = q1_lap_times.sort_by(&:time)
  end

  def calculate_lap_times_for_q2(race)
    top_15_q1_lap_times = @q1.first(15)

    q2_lap_times = []

    top_15_q1_lap_times.each do |lap_time|
      driver = lap_time.driver
      car = driver.car
      circuit = self.circuit
      ideal_lap_time = circuit.ideal_lap_time
      team_id = driver.team_id

      lap_time_q2 = lap_time(team_id, driver, car, circuit, ideal_lap_time, race) + 750

      q2_lap_times << LapTime.new(driver: driver, time: lap_time_q2)
    end

    @q2 = q2_lap_times.sort_by(&:time)
  end

  def calculate_lap_times_for_q3(race)
    top_10_q2_lap_times = @q2.first(10)

    q3_lap_times = []

    top_10_q2_lap_times.each do |lap_time|
      driver = lap_time.driver
      car = driver.car
      circuit = self.circuit
      ideal_lap_time = circuit.ideal_lap_time
      team_id = driver.team_id

      lap_time_q3 = lap_time(team_id, driver, car, circuit, ideal_lap_time, race)

      q3_lap_times << LapTime.new(driver: driver, time: lap_time_q3)
    end

    @q3 = q3_lap_times.sort_by(&:time)
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
    rainy_race_adjustment = self.weather == 'Rainy' ? (11 - driver.wet_race) * rand(0..400) + ((self.circuit.ideal_lap_time / 100) * 21) : 0
    light_rain_race_adjustment = self.weather == 'Light Rain' ? (11 - driver.wet_race) * rand(0..400) + ((self.circuit.ideal_lap_time / 100) * 11) : 0
    driver_error_variations = [0, 0, 0, 0, 150, 150, 300, 300, 500, 500]
    randomize_proficiency = rand(0..3)
    driver_errors = driver_error_variations[randomize_proficiency]

    driving_skills_adjustment + fitness_level_adjustment + driver_errors + light_rain_race_adjustment + rainy_race_adjustment
  end

  def car_adjustment(team_id, car, circuit, race)
    self.car_adjustments ||= {}

    if car_adjustments[car.id].nil?
      gearbox_adjustments ||= (9.9 - car.gearbox) * circuit_characteristics(circuit) * 1 / 30
      suspension_adjustments ||= (9.9 - car.suspension) * circuit_characteristics(circuit) * 1 / 30
      downforce_adjustments ||= (9.9 - car.downforce) * circuit_characteristics(circuit) * 2 / 30
      aero_setup ||= aero_setup(team_id, car, circuit, race)
      gear_ratio ||= gear_ratio(team_id, car, circuit, race)

      car_adjustments[car.id] = gearbox_adjustments + suspension_adjustments + downforce_adjustments + aero_setup + gear_ratio
    end

    car_adjustments[car.id]
  end

  def aero_setup(team_id, car, circuit, race)
    if car.team_id != race.team_id
      car.aero_setup = circuit.ideal_aero_setup
      car.save
      #aero_setup_variation = [0, 0, 0, 100]
      #randomize_aero = rand(0..3)
      opponent_aero_setup ||= 0
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
          -50
        when 'Cornering'
          50
        when 'Balanced'
          100
        when 'Straights'
          150
        when 'Minimum downforce'
          200
        else
          0
        end
      when 'Cornering'
        case car.aero_setup
        when 'Maximum downforce'
          50
        when 'Cornering'
          -50
        when 'Balanced'
          50
        when 'Straights'
          100
        when 'Minimum downforce'
          150
        else
          0
        end
      when 'Balanced'
        case car.aero_setup
        when 'Maximum downforce'
          100
        when 'Cornering'
          50
        when 'Balanced'
          -50
        when 'Straights'
          50
        when 'Minimum downforce'
          100
        else
          0
        end
      when 'Straights'
        case car.aero_setup
        when 'Maximum downforce'
          150
        when 'Cornering'
          100
        when 'Balanced'
          50
        when 'Straights'
          -50
        when 'Minimum downforce'
          50
        else
          0
        end
      when 'Minimum downforce'
        case car.aero_setup
        when 'Maximum downforce'
          200
        when 'Cornering'
          150
        when 'Balanced'
          100
        when 'Straights'
          50
        when 'Minimum downforce'
          -50
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

  def gear_ratio(team_id, car, circuit, race)
    if car.team_id != race.team_id
      car.gear_ratio = circuit.ideal_gear_ratio
      car.save
      opponent_gear_ratio ||= 0
    else
      calculate_gear_ratio_mistake(team_id, car, circuit, race)
    end
  end

  def calculate_gear_ratio_mistake(team_id, car, circuit, race)
    ideal_gear_ratio = circuit.ideal_gear_ratio

    if car.team_id == race.team_id
      case ideal_gear_ratio
      when 'Acceleration'
        case car.gear_ratio
        when 'Acceleration'
          -25
        when 'Balanced'
          25
        when 'Top Speed'
          50
        else
          0
        end
      when 'Balanced'
        case car.gear_ratio
        when 'Acceleration'
          25
        when 'Balanced'
          -25
        when 'Top Speed'
          25
        else
          0
        end
      when 'Top Speed'
        case car.gear_ratio
        when 'Acceleration'
          50
        when 'Balanced'
          25
        when 'Top Speed'
          -25
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
      weather_variations = ['Sunny', 'Cloudy', 'Rainy', 'Sunny', 'Cloudy', 'Light Rain']
      randomize_weather = rand(0..5)
      weather = weather_variations[randomize_weather]
      self.weather = weather
    else
      self.weather
    end
  end

  def set_status
    self.status = 'Before qualifying'
  end
end
