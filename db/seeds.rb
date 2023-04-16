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
