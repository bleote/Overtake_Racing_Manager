require "open-uri"

puts 'Cleaning Database (Races, Circuits, Drivers, Cars, Chiefs, and Teams)'
Race.destroy_all
Circuit.destroy_all
Driver.destroy_all
Car.destroy_all
Chief.destroy_all
Team.destroy_all

puts 'Creating 10 teams...'

Team.create(
  id: 1,
  team_name: 'Red Bull',
  team_logo: 'redbull_logo.png',
  color: 'Dark Blue',
  description: 'Red Bull finished 1st in 2021',
  team_points: 0
)

Team.create(
  id: 2,
  team_name: 'Ferrari',
  team_logo: 'ferrari_logo.png',
  color: 'Red',
  description: 'Ferrari finished 2nd in 2021',
  team_points: 0
)

Team.create(
  id: 3,
  team_name: 'Mercedes',
  team_logo: 'mercedes_logo.png',
  color: 'Black',
  description: 'Mercedes finished 3rd in 2021',
  team_points: 0
)

Team.create(
  id: 4,
  team_name: 'McLaren',
  team_logo: 'mclaren_logo.png',
  color: 'Orange',
  description: 'McLaren finished 5th in 2021',
  team_points: 0
)

Team.create(
  id: 5,
  team_name: 'Aston Martin',
  team_logo: 'astonmartin_logo.png',
  color: 'Green',
  description: 'Aston Martin finished 7th in 2021',
  team_points: 0
)

Team.create(
  id: 6,
  team_name: 'Alpine',
  team_logo: 'alpine_logo.png',
  color: 'Light Blue',
  description: 'Alpine finished 4th in 2021',
  team_points: 0
)

Team.create(
  id: 7,
  team_name: 'Haas',
  team_logo: 'haas_logo.png',
  color: 'White',
  description: 'Haas finished 8th in 2021',
  team_points: 0
)

Team.create(
  id: 8,
  team_name: 'Alfa Romeo',
  team_logo: 'alfaromeo_logo.png',
  color: 'Red and White',
  description: 'Alfa Romeo finished 6th in 2021',
  team_points: 0
)

Team.create(
  id: 9,
  team_name: 'AlphaTauri',
  team_logo: 'alphatauri_logo.png',
  color: 'White and Blue',
  description: 'AlphaTauri finished 9th in 2021',
  team_points: 0
)

Team.create(
  id: 10,
  team_name: 'Williams',
  team_logo: 'williams_logo.png',
  color: 'Blue',
  description: 'Williams finished 10th in 2021',
  team_points: 0
)

puts '10 teams created!'

puts 'Hiring Team Principals...'
Chief.create(
  id: 1,
  chief_name: 'Christian Horner',
  chief_image: 'horner.png',
  team_id: 1
)

Chief.create(
  id: 2,
  chief_name: 'Frédéric Vasseur',
  chief_image: 'vasseur.png',
  team_id: 2
)

Chief.create(
  id: 3,
  chief_name: 'Toto Wolff',
  chief_image: 'wolff.png',
  team_id: 3
)

Chief.create(
  id: 4,
  chief_name: 'Andrea Stella',
  chief_image: 'stella.png',
  team_id: 4
)

Chief.create(
  id: 5,
  chief_name: 'Mike Krack',
  chief_image: 'krack.png',
  team_id: 5
)

Chief.create(
  id: 6,
  chief_name: 'Otmar Szafnauer',
  chief_image: 'szafnauer.png',
  team_id: 6
)

Chief.create(
  id: 7,
  chief_name: 'Guenther Steiner',
  chief_image: 'steiner.png',
  team_id: 7
)

Chief.create(
  id: 8,
  chief_name: 'Alessandro Bravi',
  chief_image: 'bravi.png',
  team_id: 8
)

Chief.create(
  id: 9,
  chief_name: 'Franz Tost',
  chief_image: 'tost.png',
  team_id: 9
)

Chief.create(
  id: 10,
  chief_name: 'James Vowles',
  chief_image: 'vowles.png',
  team_id: 10
)

puts 'Team Principals hired!'

puts 'Teams are now building their chassis...'
Car.create(
  id: 1,
  team_id: 1,
  car_image: 'redbull_car.png',
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
  car_image: 'redbull_car.png',
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
  car_image: 'ferrari_car.png',
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
  car_image: 'ferrari_car.png',
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
  car_image: 'mercedes_car.png',
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
  car_image: 'mercedes_car.png',
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
  car_image: 'mclaren_car.png',
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
  car_image: 'mclaren_car.png',
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
  car_image: 'astonmartin_car.png',
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
  car_image: 'astonmartin_car.png',
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
  car_image: 'alpine_car.png',
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
  car_image: 'alpine_car.png',
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
  car_image: 'haas_car.png',
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
  car_image: 'haas_car.png',
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
  car_image: 'alfaromeo_car.png',
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
  car_image: 'alfaromeo_car.png',
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
  car_image: 'alphatauri_car.png',
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
  car_image: 'alphatauri_car.png',
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
  car_image: 'williams_car.png',
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
  car_image: 'williams_car.png',
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

puts 'Teams are signing with drivers...'

Driver.create(
  id: 1,
  driver_name: 'Max Verstappen',
  helmet: '',
  team_id: 1,
  car_id: 1,
  driving_skills: 10,
  fitness_level: 10,
  overtaking: 10,
  defending: 9,
  wet_race: 10,
  driver_points: 0
)

Driver.create(
  id: 2,
  driver_name: 'Sergio Pérez',
  helmet: '',
  team_id: 1,
  car_id: 2,
  driving_skills: 9,
  fitness_level: 9,
  overtaking: 8,
  defending: 10,
  wet_race: 7,
  driver_points: 0
)

Driver.create(
  id: 3,
  driver_name: 'Charles Leclerc',
  helmet: '',
  team_id: 2,
  car_id: 3,
  driving_skills: 10,
  fitness_level: 10,
  overtaking: 9,
  defending: 9,
  wet_race: 8,
  driver_points: 0
)

Driver.create(
  id: 4,
  driver_name: 'Carlos Sainz',
  helmet: '',
  team_id: 2,
  car_id: 4,
  driving_skills: 9,
  fitness_level: 9,
  overtaking: 9,
  defending: 9,
  wet_race: 10,
  driver_points: 0
)

Driver.create(
  id: 5,
  driver_name: 'Lewis Hamilton',
  helmet: '',
  team_id: 3,
  car_id: 5,
  driving_skills: 10,
  fitness_level: 10,
  overtaking: 9,
  defending: 9,
  wet_race: 10,
  driver_points: 0
)

Driver.create(
  id: 6,
  driver_name: 'George Russell',
  helmet: '',
  team_id: 3,
  car_id: 6,
  driving_skills: 10,
  fitness_level: 10,
  overtaking: 9,
  defending: 10,
  wet_race: 9,
  driver_points: 0
)

Driver.create(
  id: 7,
  driver_name: 'Lando Norris',
  helmet: '',
  team_id: 4,
  car_id: 7,
  driving_skills: 9,
  fitness_level: 9,
  overtaking: 8,
  defending: 8,
  wet_race: 9,
  driver_points: 0
)

Driver.create(
  id: 8,
  driver_name: 'Oscar Piastri',
  helmet: '',
  team_id: 4,
  car_id: 8,
  driving_skills: 8,
  fitness_level: 9,
  overtaking: 8,
  defending: 7,
  wet_race: 6,
  driver_points: 0
)

Driver.create(
  id: 9,
  driver_name: 'Fernando Alonso',
  helmet: '',
  team_id: 5,
  car_id: 9,
  driving_skills: 10,
  fitness_level: 9,
  overtaking: 10,
  defending: 10,
  wet_race: 10,
  driver_points: 0
)

Driver.create(
  id: 10,
  driver_name: 'Lance Stroll',
  helmet: '',
  team_id: 5,
  car_id: 10,
  driving_skills: 7,
  fitness_level: 8,
  overtaking: 7,
  defending: 6,
  wet_race: 8,
  driver_points: 0
)

Driver.create(
  id: 11,
  driver_name: 'Esteban Ocon',
  helmet: '',
  team_id: 6,
  car_id: 11,
  driving_skills: 8,
  fitness_level: 8,
  overtaking: 8,
  defending: 10,
  wet_race: 7,
  driver_points: 0
)

Driver.create(
  id: 12,
  driver_name: 'Pierre Gasly',
  helmet: '',
  team_id: 6,
  car_id: 12,
  driving_skills: 8,
  fitness_level: 9,
  overtaking: 8,
  defending: 9,
  wet_race: 7,
  driver_points: 0
)

Driver.create(
  id: 13,
  driver_name: 'Nico Hülkenberg',
  helmet: '',
  team_id: 7,
  car_id: 13,
  driving_skills: 9,
  fitness_level: 9,
  overtaking: 8,
  defending: 8,
  wet_race: 7,
  driver_points: 0
)

Driver.create(
  id: 14,
  driver_name: 'Kevin Magnussen',
  helmet: '',
  team_id: 7,
  car_id: 14,
  driving_skills: 8,
  fitness_level: 8,
  overtaking: 8,
  defending: 9,
  wet_race: 8,
  driver_points: 0
)

Driver.create(
  id: 15,
  driver_name: 'Valtteri Bottas',
  helmet: '',
  team_id: 8,
  car_id: 15,
  driving_skills: 8,
  fitness_level: 9,
  overtaking: 8,
  defending: 8,
  wet_race: 7,
  driver_points: 0
)

Driver.create(
  id: 16,
  driver_name: 'Zhou Guanyu',
  helmet: '',
  team_id: 8,
  car_id: 16,
  driving_skills: 7,
  fitness_level: 9,
  overtaking: 8,
  defending: 8,
  wet_race: 6,
  driver_points: 0
)

Driver.create(
  id: 17,
  driver_name: 'Yuki Tsunoda',
  helmet: '',
  team_id: 9,
  car_id: 17,
  driving_skills: 7,
  fitness_level: 8,
  overtaking: 8,
  defending: 7,
  wet_race: 5,
  driver_points: 0
)

Driver.create(
  id: 18,
  driver_name: 'Nyck de Vries',
  helmet: '',
  team_id: 9,
  car_id: 18,
  driving_skills: 8,
  fitness_level: 9,
  overtaking: 7,
  defending: 7,
  wet_race: 7,
  driver_points: 0
)

Driver.create(
  id: 19,
  driver_name: 'Alex Albon',
  helmet: '',
  team_id: 10,
  car_id: 19,
  driving_skills: 9,
  fitness_level: 9,
  overtaking: 8,
  defending: 7,
  wet_race: 8,
  driver_points: 0
)

Driver.create(
  id: 20,
  driver_name: 'Logan Sargeant',
  helmet: '',
  team_id: 10,
  car_id: 20,
  driving_skills: 7,
  fitness_level: 9,
  overtaking: 7,
  defending: 6,
  wet_race: 5,
  driver_points: 0
)

puts 'All drivers are signed!'

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
