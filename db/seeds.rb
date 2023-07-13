require "open-uri"

puts 'Cleaning Database (Circuits, Drivers, Cars, Chiefs, and Teams)'
Circuit.destroy_all
Driver.destroy_all
Car.destroy_all
Chief.destroy_all
Team.destroy_all

puts 'Creating 10 teams...'

Team.create(
  id: 1,
  name: 'Red Bull',
  logo: 'redbull_logo.png',
  color: 'Dark Blue',
  description: 'Red Bull finished 1st in 2021',
  points: 0
)

Team.create(
  id: 2,
  name: 'Ferrari',
  logo: 'ferrari_logo.png',
  color: 'Red',
  description: 'Ferrari finished 2nd in 2021',
  points: 0
)

Team.create(
  id: 3,
  name: 'Mercedes',
  logo: 'mercedes_logo.png',
  color: 'Black',
  description: 'Mercedes finished 3rd in 2021',
  points: 0
)

Team.create(
  id: 4,
  name: 'McLaren',
  logo: 'mclaren_logo.png',
  color: 'Orange',
  description: 'McLaren finished 5th in 2021',
  points: 0
)

Team.create(
  id: 5,
  name: 'Aston Martin',
  logo: 'astonmartin_logo.png',
  color: 'Green',
  description: 'Aston Martin finished 7th in 2021',
  points: 0
)

Team.create(
  id: 6,
  name: 'Alpine',
  logo: 'alpine_logo.png',
  color: 'Light Blue',
  description: 'Alpine finished 4th in 2021',
  points: 0
)

Team.create(
  id: 7,
  name: 'Haas',
  logo: 'haas_logo.png',
  color: 'White',
  description: 'Haas finished 8th in 2021',
  points: 0
)

Team.create(
  id: 8,
  name: 'Alfa Romeo',
  logo: 'alfaromeo_logo.png',
  color: 'Red and White',
  description: 'Alfa Romeo finished 6th in 2021',
  points: 0
)

Team.create(
  id: 9,
  name: 'AlphaTauri',
  logo: 'alphatauri_logo.png',
  color: 'White and Blue',
  description: 'AlphaTauri finished 9th in 2021',
  points: 0
)

Team.create(
  id: 10,
  name: 'Williams',
  logo: 'williams_logo.png',
  color: 'Blue',
  description: 'Williams finished 10th in 2021',
  points: 0
)

puts '10 teams created!'

puts 'Hiring Team Principals...'
Chief.create(
  id: 1,
  name: 'Christian Horner',
  image: 'horner.png',
  team_id: 1
)

Chief.create(
  id: 2,
  name: 'Frédéric Vasseur',
  image: 'vasseur.png',
  team_id: 2
)

Chief.create(
  id: 3,
  name: 'Toto Wolff',
  image: 'wolff.png',
  team_id: 3
)

Chief.create(
  id: 4,
  name: 'Andrea Stella',
  image: 'stella.png',
  team_id: 4
)

Chief.create(
  id: 5,
  name: 'Mike Krack',
  image: 'krack.png',
  team_id: 5
)

Chief.create(
  id: 6,
  name: 'Otmar Szafnauer',
  image: 'szafnauer.png',
  team_id: 6
)

Chief.create(
  id: 7,
  name: 'Guenther Steiner',
  image: 'steiner.png',
  team_id: 7
)

Chief.create(
  id: 8,
  name: 'Alessandro Bravi',
  image: 'bravi.png',
  team_id: 8
)

Chief.create(
  id: 9,
  name: 'Franz Tost',
  image: 'tost.png',
  team_id: 9
)

Chief.create(
  id: 10,
  name: 'James Vowles',
  image: 'vowles.png',
  team_id: 10
)

puts 'Team Principals hired!'

puts 'Teams are now building their chassis...'
Car.create(
  id: 1,
  team_id: 1,
  image: 'redbull_car.png',
  image_lg: 'redbull_car_lg.png',
  constructor: 'Red Bull',
  engine: 'Red Bull Power Trains',
  gearbox: 10,
  suspension: 10,
  downforce: 10,
  aero_setup: 'Balanced',
  gear_ratio: 'Balanced',
  tyres: 'Soft'
)

Car.create(
  id: 2,
  team_id: 1,
  image: 'redbull_car.png',
  image_lg: 'redbull_car_lg.png',
  constructor: 'Red Bull',
  engine: 'Red Bull Power Trains',
  gearbox: 10,
  suspension: 10,
  downforce: 10,
  aero_setup: 'Balanced',
  gear_ratio: 'Balanced',
  tyres: 'Soft'
)

Car.create(
  id: 3,
  team_id: 2,
  image: 'ferrari_car.png',
  image_lg: 'ferrari_car_lg.png',
  constructor: 'Ferrari',
  engine: 'Ferrari',
  gearbox: 10,
  suspension: 10,
  downforce: 9,
  aero_setup: 'Balanced',
  gear_ratio: 'Balanced',
  tyres: 'Soft'
)

Car.create(
  id: 4,
  team_id: 2,
  image: 'ferrari_car.png',
  image_lg: 'ferrari_car_lg.png',
  constructor: 'Ferrari',
  engine: 'Ferrari',
  gearbox: 10,
  suspension: 10,
  downforce: 9,
  aero_setup: 'Balanced',
  gear_ratio: 'Balanced',
  tyres: 'Soft'
)

Car.create(
  id: 5,
  team_id: 3,
  image: 'mercedes_car.png',
  image_lg: 'mercedes_car_lg.png',
  constructor: 'Mercedes',
  engine: 'Mercedes',
  gearbox: 10,
  suspension: 9,
  downforce: 10,
  aero_setup: 'Balanced',
  gear_ratio: 'Balanced',
  tyres: 'Soft'
)

Car.create(
  id: 6,
  team_id: 3,
  image: 'mercedes_car.png',
  image_lg: 'mercedes_car_lg.png',
  constructor: 'Mercedes',
  engine: 'Mercedes',
  gearbox: 10,
  suspension: 9,
  downforce: 10,
  aero_setup: 'Balanced',
  gear_ratio: 'Balanced',
  tyres: 'Soft'
)

Car.create(
  id: 7,
  team_id: 4,
  image: 'mclaren_car.png',
  image_lg: 'mclaren_car_lg.png',
  constructor: 'McLaren',
  engine: 'Mercedes',
  gearbox: 9,
  suspension: 9,
  downforce: 9,
  aero_setup: 'Balanced',
  gear_ratio: 'Balanced',
  tyres: 'Soft'
)

Car.create(
  id: 8,
  team_id: 4,
  image: 'mclaren_car.png',
  image_lg: 'mclaren_car_lg.png',
  constructor: 'McLaren',
  engine: 'Mercedes',
  gearbox: 9,
  suspension: 9,
  downforce: 9,
  aero_setup: 'Balanced',
  gear_ratio: 'Balanced',
  tyres: 'Soft'
)

Car.create(
  id: 9,
  team_id: 5,
  image: 'astonmartin_car.png',
  image_lg: 'astonmartin_car_lg.png',
  constructor: 'Aston Martin',
  engine: 'Mercedes',
  gearbox: 9,
  suspension: 9,
  downforce: 10,
  aero_setup: 'Balanced',
  gear_ratio: 'Balanced',
  tyres: 'Soft'
)

Car.create(
  id: 10,
  team_id: 5,
  image: 'astonmartin_car.png',
  image_lg: 'astonmartin_car_lg.png',
  constructor: 'Aston Martin',
  engine: 'Mercedes',
  gearbox: 9,
  suspension: 9,
  downforce: 10,
  aero_setup: 'Balanced',
  gear_ratio: 'Balanced',
  tyres: 'Soft'
)

Car.create(
  id: 11,
  team_id: 6,
  image: 'alpine_car.png',
  image_lg: 'alpine_car_lg.png',
  constructor: 'Alpine',
  engine: 'Renault',
  gearbox: 9,
  suspension: 8,
  downforce: 9,
  aero_setup: 'Balanced',
  gear_ratio: 'Balanced',
  tyres: 'Soft'
)

Car.create(
  id: 12,
  team_id: 6,
  image: 'alpine_car.png',
  image_lg: 'alpine_car_lg.png',
  constructor: 'Alpine',
  engine: 'Renault',
  gearbox: 9,
  suspension: 8,
  downforce: 9,
  aero_setup: 'Balanced',
  gear_ratio: 'Balanced',
  tyres: 'Soft'
)

Car.create(
  id: 13,
  team_id: 7,
  image: 'haas_car.png',
  image_lg: 'haas_car_lg.png',
  constructor: 'Haas',
  engine: 'Ferrari',
  gearbox: 8,
  suspension: 9,
  downforce: 8,
  aero_setup: 'Balanced',
  gear_ratio: 'Balanced',
  tyres: 'Soft'
)

Car.create(
  id: 14,
  team_id: 7,
  image: 'haas_car.png',
  image_lg: 'haas_car_lg.png',
  constructor: 'Haas',
  engine: 'Ferrari',
  gearbox: 8,
  suspension: 9,
  downforce: 8,
  aero_setup: 'Balanced',
  gear_ratio: 'Balanced',
  tyres: 'Soft'
)

Car.create(
  id: 15,
  team_id: 8,
  image: 'alfaromeo_car.png',
  image_lg: 'alfaromeo_car_lg.png',
  constructor: 'Alfa Romeo',
  engine: 'Ferrari',
  gearbox: 8,
  suspension: 8,
  downforce: 8,
  aero_setup: 'Balanced',
  gear_ratio: 'Balanced',
  tyres: 'Soft'
)

Car.create(
  id: 16,
  team_id: 8,
  image: 'alfaromeo_car.png',
  image_lg: 'alfaromeo_car_lg.png',
  constructor: 'Alfa Romeo',
  engine: 'Ferrari',
  gearbox: 8,
  suspension: 8,
  downforce: 8,
  aero_setup: 'Balanced',
  gear_ratio: 'Balanced',
  tyres: 'Soft'
)

Car.create(
  id: 17,
  team_id: 9,
  image: 'alphatauri_car.png',
  image_lg: 'alphatauri_car_lg.png',
  constructor: 'AlphaTauri',
  engine: 'Red Bull Power Trains',
  gearbox: 8,
  suspension: 7,
  downforce: 8,
  aero_setup: 'Balanced',
  gear_ratio: 'Balanced',
  tyres: 'Soft'
)

Car.create(
  id: 18,
  team_id: 9,
  image: 'alphatauri_car.png',
  image_lg: 'alphatauri_car_lg.png',
  constructor: 'AlphaTauri',
  engine: 'Red Bull Power Trains',
  gearbox: 8,
  suspension: 7,
  downforce: 8,
  aero_setup: 'Balanced',
  gear_ratio: 'Balanced',
  tyres: 'Soft'
)

Car.create(
  id: 19,
  team_id: 10,
  image: 'williams_car.png',
  image_lg: 'williams_car_lg.png',
  constructor: 'Williams',
  engine: 'Mercedes',
  gearbox: 8,
  suspension: 7,
  downforce: 8,
  aero_setup: 'Balanced',
  gear_ratio: 'Balanced',
  tyres: 'Soft'
)

Car.create(
  id: 20,
  team_id: 10,
  image: 'williams_car.png',
  image_lg: 'williams_car_lg.png',
  constructor: 'Williams',
  engine: 'Mercedes',
  gearbox: 8,
  suspension: 7,
  downforce: 8,
  aero_setup: 'Balanced',
  gear_ratio: 'Balanced',
  tyres: 'Soft'
)

puts 'All cars were built and tested!'

puts 'Teams are signing with drivers...'

Driver.create(
  id: 1,
  name: 'Max Verstappen',
  initials: 'VER',
  picture: 'verstappen_picture.png',
  helmet: 'verstappen_helmet.png',
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
  name: 'Sergio Pérez',
  initials: 'PER',
  picture: 'perez_picture.png',
  helmet: 'perez_helmet.png',
  team_id: 1,
  car_id: 2,
  driving_skills: 9,
  fitness_level: 10,
  overtaking: 8,
  defending: 10,
  wet_race: 7,
  driver_points: 0
)

Driver.create(
  id: 3,
  name: 'Charles Leclerc',
  initials: 'LEC',
  picture: 'leclerc_picture.png',
  helmet: 'leclerc_helmet.png',
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
  name: 'Carlos Sainz',
  initials: 'SAI',
  picture: 'sainz_picture.png',
  helmet: 'sainz_helmet.png',
  team_id: 2,
  car_id: 4,
  driving_skills: 10,
  fitness_level: 9,
  overtaking: 9,
  defending: 9,
  wet_race: 10,
  driver_points: 0
)

Driver.create(
  id: 5,
  name: 'Lewis Hamilton',
  initials: 'HAM',
  picture: 'hamilton_picture.png',
  helmet: 'hamilton_helmet.png',
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
  name: 'George Russell',
  initials: 'RUS',
  picture: 'russell_picture.png',
  helmet: 'russell_helmet.png',
  team_id: 3,
  car_id: 6,
  driving_skills: 10,
  fitness_level: 10,
  overtaking: 9,
  defending: 10,
  wet_race: 10,
  driver_points: 0
)

Driver.create(
  id: 7,
  name: 'Lando Norris',
  initials: 'NOR',
  picture: 'norris_picture.png',
  helmet: 'norris_helmet.png',
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
  name: 'Oscar Piastri',
  initials: 'PIA',
  picture: 'piastri_picture.png',
  helmet: 'piastri_helmet.png',
  team_id: 4,
  car_id: 8,
  driving_skills: 8,
  fitness_level: 9,
  overtaking: 8,
  defending: 7,
  wet_race: 8,
  driver_points: 0
)

Driver.create(
  id: 9,
  name: 'Fernando Alonso',
  initials: 'ALO',
  picture: 'alonso_picture.png',
  helmet: 'alonso_helmet.png',
  team_id: 5,
  car_id: 9,
  driving_skills: 10,
  fitness_level: 10,
  overtaking: 10,
  defending: 10,
  wet_race: 10,
  driver_points: 0
)

Driver.create(
  id: 10,
  name: 'Lance Stroll',
  initials: 'STR',
  picture: 'stroll_picture.png',
  helmet: 'stroll_helmet.png',
  team_id: 5,
  car_id: 10,
  driving_skills: 8,
  fitness_level: 8,
  overtaking: 7,
  defending: 6,
  wet_race: 8,
  driver_points: 0
)

Driver.create(
  id: 11,
  name: 'Esteban Ocon',
  initials: 'OCO',
  picture: 'ocon_picture.png',
  helmet: 'ocon_helmet.png',
  team_id: 6,
  car_id: 11,
  driving_skills: 9,
  fitness_level: 9,
  overtaking: 8,
  defending: 10,
  wet_race: 10,
  driver_points: 0
)

Driver.create(
  id: 12,
  name: 'Pierre Gasly',
  initials: 'GAS',
  picture: 'gasly_picture.png',
  helmet: 'gasly_helmet.png',
  team_id: 6,
  car_id: 12,
  driving_skills: 9,
  fitness_level: 8,
  overtaking: 8,
  defending: 9,
  wet_race: 8,
  driver_points: 0
)

Driver.create(
  id: 13,
  name: 'Nico Hülkenberg',
  initials: 'HUL',
  picture: 'hulkenberg_picture.png',
  helmet: 'hulkenberg_helmet.png',
  team_id: 7,
  car_id: 13,
  driving_skills: 9,
  fitness_level: 9,
  overtaking: 8,
  defending: 8,
  wet_race: 10,
  driver_points: 0
)

Driver.create(
  id: 14,
  name: 'Kevin Magnussen',
  initials: 'MAG',
  picture: 'magnussen_picture.png',
  helmet: 'magnussen_helmet.png',
  team_id: 7,
  car_id: 14,
  driving_skills: 8,
  fitness_level: 9,
  overtaking: 8,
  defending: 9,
  wet_race: 9,
  driver_points: 0
)

Driver.create(
  id: 15,
  name: 'Valtteri Bottas',
  initials: 'BOT',
  picture: 'bottas_picture.png',
  helmet: 'bottas_helmet.png',
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
  name: 'Zhou Guanyu',
  initials: 'ZHO',
  picture: 'guanyu_picture.png',
  helmet: 'guanyu_helmet.png',
  team_id: 8,
  car_id: 16,
  driving_skills: 8,
  fitness_level: 9,
  overtaking: 8,
  defending: 8,
  wet_race: 6,
  driver_points: 0
)

Driver.create(
  id: 17,
  name: 'Yuki Tsunoda',
  initials: 'TSU',
  picture: 'tsunoda_picture.png',
  helmet: 'tsunoda_helmet.png',
  team_id: 9,
  car_id: 17,
  driving_skills: 8,
  fitness_level: 9,
  overtaking: 8,
  defending: 7,
  wet_race: 7,
  driver_points: 0
)

Driver.create(
  id: 18,
  name: 'Nyck de Vries',
  initials: 'DEV',
  picture: 'devries_picture.png',
  helmet: 'devries_helmet.png',
  team_id: 9,
  car_id: 18,
  driving_skills: 8,
  fitness_level: 8,
  overtaking: 7,
  defending: 7,
  wet_race: 6,
  driver_points: 0
)

Driver.create(
  id: 19,
  name: 'Alex Albon',
  initials: 'ALB',
  picture: 'albon_picture.png',
  helmet: 'albon_helmet.png',
  team_id: 10,
  car_id: 19,
  driving_skills: 9,
  fitness_level: 9,
  overtaking: 8,
  defending: 7,
  wet_race: 10,
  driver_points: 0
)

Driver.create(
  id: 20,
  name: 'Logan Sargeant',
  initials: 'SAR',
  picture: 'sargeant_picture.png',
  helmet: 'sargeant_helmet.png',
  team_id: 10,
  car_id: 20,
  driving_skills: 7,
  fitness_level: 10,
  overtaking: 7,
  defending: 6,
  wet_race: 5,
  driver_points: 0
)

puts 'All drivers are signed!'

puts 'creating 1 circuit...'

Circuit.create(
  id: 1,
  name: 'Brazil',
  flag: 'brazil_flag.png',
  layout: 'brazil_layout.png',
  ideal_aero_setup: 'Balanced',
  ideal_gear_ratio: 'Balanced',
  slow_corners: 3,
  medium_corners: 4,
  fast_corners: 8,
  short_straights: 5,
  medium_straights: 4,
  long_straights: 2,
  pitstop_time: 20_600,
  ideal_lap_time: 67_794,
  total_laps: 71
)

puts '1 circuit created!'
