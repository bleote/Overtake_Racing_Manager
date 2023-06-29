class Race < ApplicationRecord
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

  def lap_time(driver, car, circuit, ideal_lap_time)
    # Calculate time adjustments based on driver skills and car performance
    driver_adjustment = driver_adjustment(driver)
    car_adjustment = car_adjustment(car, circuit)

    # Add adjustments to the ideal lap time to get the final lap time
    ideal_lap_time + driver_adjustment + car_adjustment
  end

  def calculate_lap_times_for_q1
    drivers = Driver.all.limit(20)
    q1_lap_times = []

    drivers.each do |driver|
      car = driver.car
      circuit = self.circuit
      ideal_lap_time = circuit.ideal_lap_time

      # Calculate lap time using the lap_time method
      lap_time_q1 = lap_time(driver, car, circuit, ideal_lap_time) + 1500

      # Create a LapTime object to store the lap time information
      q1_lap_times << LapTime.new(driver: driver, time: lap_time_q1)
    end

    @q1 = q1_lap_times.sort_by(&:time)
  end

  def calculate_lap_times_for_q2
    top_15_q1_lap_times = @q1.first(15)

    q2_lap_times = []

    top_15_q1_lap_times.each do |lap_time|
      driver = lap_time.driver
      car = driver.car
      circuit = self.circuit
      ideal_lap_time = circuit.ideal_lap_time

      lap_time_q2 = lap_time(driver, car, circuit, ideal_lap_time) + 750

      q2_lap_times << LapTime.new(driver: driver, time: lap_time_q2)
    end

    @q2 = q2_lap_times.sort_by(&:time)
  end

  def calculate_lap_times_for_q3
    top_10_q2_lap_times = @q2.first(10)

    q3_lap_times = []

    top_10_q2_lap_times.each do |lap_time|
      driver = lap_time.driver
      car = driver.car
      circuit = self.circuit
      ideal_lap_time = circuit.ideal_lap_time

      lap_time_q3 = lap_time(driver, car, circuit, ideal_lap_time)

      q3_lap_times << LapTime.new(driver: driver, time: lap_time_q3)
    end

    @q3 = q3_lap_times.sort_by(&:time)
  end

  def calculate_race_laps(starting_grid)
    driver_lap_times = {} # Store lap times for each driver
    total_laps = self.circuit.total_laps

    total_laps.times do |lap_number|
      sorted_grid = starting_grid

      sorted_grid.each_with_index do |lap_time, index|
        driver = lap_time.driver
        car = driver.car
        circuit = self.circuit
        ideal_lap_time = circuit.ideal_lap_time

        lap_time_race = lap_time(driver, car, circuit, ideal_lap_time)

        # Add time penalty on the first lap based on the driver's position
        if lap_number.zero?
          time_penalty = index * 250 # 250 milliseconds
          lap_time_race += time_penalty
        end

        # Add the current lap time to the driver's total race time
        driver_lap_times[driver] ||= []
        driver_lap_times[driver] << { lap_time: lap_time_race }
      end
    end

    driver_lap_times
  end

  private

  def circuit_corners(circuit)
    total_corner_time ||= (circuit.slow_corners * 30) + (circuit.medium_corners * 20) + (circuit.fast_corners * 10)
  end

  def circuit_straights(circuit)
    total_straight_time ||= (circuit.short_straights * 30) + (circuit.medium_straights * 40) + (circuit.long_straights * 60)
  end

  def driver_adjustment(driver)
    # Adjust the lap time based on the driver's skills
    proficiency_variations = [rand(0..100), rand(0..200), rand(0..300), rand(0..400)]
    randomize = rand(0..3)
    driver_proficiency = proficiency_variations[randomize]
    driving_skills_adjustment = (11 - driver.driving_skills) * driver_proficiency
    fitness_level_adjustment = (11 - driver.fitness_level) * rand(0..50)
    wet_race_adjustment = self.weather == 'Rainny' ? (11 - driver.wet_race) * rand(0..300) + ((self.circuit.ideal_lap_time / 100) * 21) : 0

    driving_skills_adjustment + fitness_level_adjustment # + wet_race_adjustment
  end

  def car_adjustment(car, circuit)
    # Adjust the lap time based on the car's performance
    gearbox_adjustment = (9.7 - car.gearbox) * circuit_characteristics(circuit) * 1 / 10
    suspension_adjustment = (9.7 - car.suspension) * circuit_characteristics(circuit) * 1 / 10
    downforce_adjustment = (9.7 - car.downforce) * circuit_characteristics(circuit) * 2 / 10

    gearbox_adjustment + suspension_adjustment + downforce_adjustment
  end

  def circuit_characteristics(circuit)
    @circuit_characteristics ||= circuit_corners(circuit) + circuit_straights(circuit)
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
      weather_variations = ['Sunny', 'Cloudy', 'Rainny']
      dice = rand(0..2)
      weather = weather_variations[dice]
      self.weather = weather
    else
      self.weather
    end
  end

  def set_status
    self.status = 'Not Started'
  end
end
