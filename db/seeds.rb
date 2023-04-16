require "open-uri"

puts 'Cleaning Database (Races, Circuits, Teams, Cars, and Drivers)'
Race.destroy_all
Circuit.destroy_all
Team.destroy_all
Driver.destroy_all
Car.destroy_all

puts 'Creating 10 teams...'

red_bull = Team.create(
  id: 1,
  team_name: 'Red Bull',
  team_logo: nil,
  color: 'Dark Blue',
  team_points: 0
)

ferrari = Team.create(
  id: 2,
  team_name: 'Ferrari',
  team_logo: nil,
  color: 'Red',
  team_points: 0
)

mercedes = Team.create(
  id: 3,
  team_name: 'Mercedes',
  team_logo: nil,
  color: 'Black',
  team_points: 0
)

mclaren = Team.create(
  id: 4,
  team_name: 'McLaren',
  team_logo: nil,
  color: 'Orange',
  team_points: 0
)

aston_martin = Team.create(
  id: 5,
  team_name: 'Aston Martin',
  team_logo: nil,
  color: 'Green',
  team_points: 0
)

alpine = Team.create(
  id: 6,
  team_name: 'Alpine',
  team_logo: nil,
  color: 'Light Blue',
  team_points: 0
)

haas = Team.create(
  id: 7,
  team_name: 'Haas',
  team_logo: nil,
  color: 'White',
  team_points: 0
)

alfa_romeo = Team.create(
  id: 8,
  team_name: 'Alfa Romeo',
  team_logo: nil,
  color: 'Red and White',
  team_points: 0
)

alphatauri = Team.create(
  id: 9,
  team_name: 'AlphaTauri',
  team_logo: nil,
  color: 'White and Blue',
  team_points: 0
)

williams = Team.create(
  id: 10,
  team_name: 'Williams',
  team_logo: nil,
  color: 'Blue',
  team_points: 0
)

puts '10 teams created!'
puts 'creating 1 circuit...'

brazil = Circuit.create(
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

race = Race.create(
  id: 1,
  user_id: 1,
  circuit_id: brazil.id,
  weather: 'Sunny',
  team01_id: red_bull.id,
  team02_id: ferrari.id,
  team03_id: mercedes.id,
  team04_id: mclaren.id,
  team05_id: aston_martin.id,
  team06_id: alpine.id,
  team07_id: haas.id,
  team08_id: alfa_romeo.id,
  team09_id: alphatauri.id,
  team10_id: williams.id,
  status: 'Not Started'
)

puts '1 race created!'
