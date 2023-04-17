require "open-uri"

puts 'Cleaning Database (Races, Circuits, Teams, Cars, and Drivers)'
Race.destroy_all
Circuit.destroy_all
Team.destroy_all
Driver.destroy_all
Car.destroy_all

puts 'Creating 10 teams...'

Team.create(
  id: 1,
  team_name: 'Red Bull',
  team_logo: nil,
  color: 'Dark Blue',
  team_points: 0
)

Team.create(
  id: 2,
  team_name: 'Ferrari',
  team_logo: nil,
  color: 'Red',
  team_points: 0
)

Team.create(
  id: 3,
  team_name: 'Mercedes',
  team_logo: nil,
  color: 'Black',
  team_points: 0
)

Team.create(
  id: 4,
  team_name: 'McLaren',
  team_logo: nil,
  color: 'Orange',
  team_points: 0
)

Team.create(
  id: 5,
  team_name: 'Aston Martin',
  team_logo: nil,
  color: 'Green',
  team_points: 0
)

Team.create(
  id: 6,
  team_name: 'Alpine',
  team_logo: nil,
  color: 'Light Blue',
  team_points: 0
)

Team.create(
  id: 7,
  team_name: 'Haas',
  team_logo: nil,
  color: 'White',
  team_points: 0
)

Team.create(
  id: 8,
  team_name: 'Alfa Romeo',
  team_logo: nil,
  color: 'Red and White',
  team_points: 0
)

Team.create(
  id: 9,
  team_name: 'AlphaTauri',
  team_logo: nil,
  color: 'White and Blue',
  team_points: 0
)

Team.create(
  id: 10,
  team_name: 'Williams',
  team_logo: nil,
  color: 'Blue',
  team_points: 0
)

puts '10 teams created!'

puts 'Hiring Team Principals...'
Chief.create(
  id: 1,
  chief_name: 'Christian Horner',
  team_id: 1
)

Chief.create(
  id: 2,
  chief_name: 'Frédéric Vasseur',
  team_id: 2
)

Chief.create(
  id: 3,
  chief_name: 'Toto Wolff',
  team_id: 3
)

Chief.create(
  id: 4,
  chief_name: 'Andrea Stella',
  team_id: 4
)

Chief.create(
  id: 5,
  chief_name: 'Mike Krack',
  team_id: 5
)

Chief.create(
  id: 6,
  chief_name: 'Otmar Szafnauer',
  team_id: 6
)

Chief.create(
  id: 7,
  chief_name: 'Guenther Steiner',
  team_id: 7
)

Chief.create(
  id: 8,
  chief_name: 'Alessandro Bravi',
  team_id: 8
)

Chief.create(
  id: 9,
  chief_name: 'Franz Tost',
  team_id: 9
)

Chief.create(
  id: 10,
  chief_name: 'James Vowles',
  team_id: 10
)

puts 'Team Principals hired!'

puts 'Teams are now building their chassis...'
Car.create(
  id: 1,
  team_id: 1,
  constructor: 'Red Bull',
  engine: 'Red Bull Power Trains',
  gearbox: 10,
  suspension: 10,
  downforce: 10,
  aero_setup: 'Neutral',
  gear_ratio: 'Normal',
  tyres: 'Soft'
)

Car.create(
  id: 2,
  team_id: 1,
  constructor: 'Red Bull',
  engine: 'Red Bull Power Trains',
  gearbox: 10,
  suspension: 10,
  downforce: 10,
  aero_setup: 'Neutral',
  gear_ratio: 'Normal',
  tyres: 'Soft'
)

Car.create(
  id: 3,
  team_id: 2,
  constructor: 'Ferrari',
  engine: 'Ferrari',
  gearbox: 10,
  suspension: 9,
  downforce: 10,
  aero_setup: 'Neutral',
  gear_ratio: 'Normal',
  tyres: 'Soft'
)

Car.create(
  id: 4,
  team_id: 2,
  constructor: 'Ferrari',
  engine: 'Ferrari',
  gearbox: 10,
  suspension: 9,
  downforce: 10,
  aero_setup: 'Neutral',
  gear_ratio: 'Normal',
  tyres: 'Soft'
)

Car.create(
  id: 5,
  team_id: 3,
  constructor: 'Mercedes',
  engine: 'Mercedes',
  gearbox: 10,
  suspension: 9,
  downforce: 9,
  aero_setup: 'Neutral',
  gear_ratio: 'Normal',
  tyres: 'Soft'
)

Car.create(
  id: 6,
  team_id: 3,
  constructor: 'Mercedes',
  engine: 'Mercedes',
  gearbox: 10,
  suspension: 9,
  downforce: 9,
  aero_setup: 'Neutral',
  gear_ratio: 'Normal',
  tyres: 'Soft'
)

Car.create(
  id: 7,
  team_id: 4,
  constructor: 'McLaren',
  engine: 'Mercedes',
  gearbox: 8,
  suspension: 7,
  downforce: 7,
  aero_setup: 'Neutral',
  gear_ratio: 'Normal',
  tyres: 'Soft'
)

Car.create(
  id: 8,
  team_id: 4,
  constructor: 'McLaren',
  engine: 'Mercedes',
  gearbox: 8,
  suspension: 7,
  downforce: 7,
  aero_setup: 'Neutral',
  gear_ratio: 'Normal',
  tyres: 'Soft'
)

Car.create(
  id: 9,
  team_id: 5,
  constructor: 'Aston Martin',
  engine: 'Mercedes',
  gearbox: 10,
  suspension: 9,
  downforce: 10,
  aero_setup: 'Neutral',
  gear_ratio: 'Normal',
  tyres: 'Soft'
)

Car.create(
  id: 10,
  team_id: 5,
  constructor: 'Aston Martin',
  engine: 'Mercedes',
  gearbox: 10,
  suspension: 9,
  downforce: 10,
  aero_setup: 'Neutral',
  gear_ratio: 'Normal',
  tyres: 'Soft'
)

Car.create(
  id: 11,
  team_id: 6,
  constructor: 'Alpine',
  engine: 'Renault',
  gearbox: 8,
  suspension: 8,
  downforce: 8,
  aero_setup: 'Neutral',
  gear_ratio: 'Normal',
  tyres: 'Soft'
)

Car.create(
  id: 12,
  team_id: 6,
  constructor: 'Alpine',
  engine: 'Renault',
  gearbox: 8,
  suspension: 8,
  downforce: 8,
  aero_setup: 'Neutral',
  gear_ratio: 'Normal',
  tyres: 'Soft'
)

Car.create(
  id: 13,
  team_id: 7,
  constructor: 'Haas',
  engine: 'Ferrari',
  gearbox: 7,
  suspension: 8,
  downforce: 7,
  aero_setup: 'Neutral',
  gear_ratio: 'Normal',
  tyres: 'Soft'
)

Car.create(
  id: 14,
  team_id: 7,
  constructor: 'Haas',
  engine: 'Ferrari',
  gearbox: 7,
  suspension: 8,
  downforce: 7,
  aero_setup: 'Neutral',
  gear_ratio: 'Normal',
  tyres: 'Soft'
)

Car.create(
  id: 15,
  team_id: 8,
  constructor: 'Alfa Romeo',
  engine: 'Ferrari',
  gearbox: 7,
  suspension: 7,
  downforce: 7,
  aero_setup: 'Neutral',
  gear_ratio: 'Normal',
  tyres: 'Soft'
)

Car.create(
  id: 16,
  team_id: 8,
  constructor: 'Alfa Romeo',
  engine: 'Ferrari',
  gearbox: 7,
  suspension: 7,
  downforce: 7,
  aero_setup: 'Neutral',
  gear_ratio: 'Normal',
  tyres: 'Soft'
)

Car.create(
  id: 17,
  team_id: 9,
  constructor: 'AlphaTauri',
  engine: 'Red Bull Power Trains',
  gearbox: 8,
  suspension: 7,
  downforce: 7,
  aero_setup: 'Neutral',
  gear_ratio: 'Normal',
  tyres: 'Soft'
)

Car.create(
  id: 18,
  team_id: 9,
  constructor: 'AlphaTauri',
  engine: 'Red Bull Power Trains',
  gearbox: 8,
  suspension: 7,
  downforce: 7,
  aero_setup: 'Neutral',
  gear_ratio: 'Normal',
  tyres: 'Soft'
)

Car.create(
  id: 19,
  team_id: 10,
  constructor: 'Williams',
  engine: 'Mercedes',
  gearbox: 7,
  suspension: 7,
  downforce: 6,
  aero_setup: 'Neutral',
  gear_ratio: 'Normal',
  tyres: 'Soft'
)

Car.create(
  id: 20,
  team_id: 10,
  constructor: 'Williams',
  engine: 'Mercedes',
  gearbox: 7,
  suspension: 7,
  downforce: 6,
  aero_setup: 'Neutral',
  gear_ratio: 'Normal',
  tyres: 'Soft'
)

puts 'All cars were built and tested!'

puts 'creating 1 circuit...'

Circuit.create(
  id: 1,
  circuit_name: 'Brazil',
  slow_curves: 3,
  medium_curves: 4,
  fast_curves: 8,
  short_straights: 5,
  medium_straights: 4,
  long_straights: 2,
  pitstop_time: 22_000
)

puts '1 circuit created!'
puts 'creating 1 race...'

Race.create(
  id: 1,
  user_id: 1,
  circuit_id: 1,
  weather: 'Sunny',
  team01_id: 1,
  team02_id: 2,
  team03_id: 3,
  team04_id: 4,
  team05_id: 5,
  team06_id: 6,
  team07_id: 7,
  team08_id: 8,
  team09_id: 9,
  team10_id: 10,
  status: 'Not Started'
)

puts '1 race created!'
