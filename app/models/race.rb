class Race < ApplicationRecord
  belongs_to :user
  belongs_to :circuit
  belongs_to :team01, class_name: 'Team'
  belongs_to :team02, class_name: 'Team'
  belongs_to :team03, class_name: 'Team'
  belongs_to :team04, class_name: 'Team'
  belongs_to :team05, class_name: 'Team'
  belongs_to :team06, class_name: 'Team'
  belongs_to :team07, class_name: 'Team'
  belongs_to :team08, class_name: 'Team'
  belongs_to :team09, class_name: 'Team'
  belongs_to :team10, class_name: 'Team'

  after_initialize :set_team_defaults
  after_initialize :set_weather
  after_initialize :set_status

  CIRCUIT = [ Circuit.find(1).circuit_name ]

  TEAM = [
    Team.find(1).team_name, Team.find(2).team_name, Team.find(3).team_name, Team.find(4).team_name,
    Team.find(5).team_name, Team.find(6).team_name, Team.find(7).team_name, Team.find(8).team_name,
    Team.find(9).team_name, Team.find(10).team_name
  ]

  validates :selected_team, inclusion: { in: TEAM }

  private

  def set_team_defaults
    self.team01_id = Team.find(1).id
    self.team02_id = Team.find(2).id
    self.team03_id = Team.find(3).id
    self.team04_id = Team.find(4).id
    self.team05_id = Team.find(5).id
    self.team06_id = Team.find(6).id
    self.team07_id = Team.find(7).id
    self.team08_id = Team.find(8).id
    self.team09_id = Team.find(9).id
    self.team10_id = Team.find(10).id
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
