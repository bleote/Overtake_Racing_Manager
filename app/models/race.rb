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

  CIRCUIT = [ Circuit.find(1).circuit_name ]

  TEAM = [
    Team.find(1).team_name, Team.find(2).team_name, Team.find(3).team_name, Team.find(4).team_name,
    Team.find(5).team_name, Team.find(6).team_name, Team.find(7).team_name, Team.find(8).team_name,
    Team.find(9).team_name, Team.find(10).team_name
  ]

  private

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
