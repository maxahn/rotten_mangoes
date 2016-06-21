# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Movie.create!(
  title: 'Finding Dory', 
  director: 'Andrew Stanton', 
  runtime_in_minutes: 103, 
  description: "Dory is a wide-eyed, blue tang fish who suffers from memory loss every 10 seconds or so. The one thing she can remember is that she somehow became separated from her parents as a child. With help from her friends Nemo and Marlin, Dory embarks on an epic adventure to find them. Her journey brings her to the Marine Life Institute, a conservatory that houses diverse ocean species. Dory now knows that her family reunion will only happen if she can save mom and dad from captivity.", 
  poster_image_url: 'http://ia.media-imdb.com/images/M/MV5BNzg4MjM2NDQ4MV5BMl5BanBnXkFtZTgwMzk3MTgyODE@._V1_SY1000_CR0,0,674,1000_AL_.jpg',
  release_date: DateTime.new(2016, 6, 17)  
)


Movie.create!(
  title: 'Independence Day', 
  director: 'Roland Emmerich', 
  runtime_in_minutes: 153, 
  description: "On July 2nd, communications systems worldwide are sent into chaos by a strange atmospheric interference. It is soon learned by the military that a number of enormous objects are on a collision course with Earth. At first thought to be meteors, they are later revealed to be gigantic spacecraft, piloted by a mysterious alien species. After attempts to communicate with the aliens go nowhere, David Levinson, an ex-scientist turned cable technician, discovers that the aliens are going to attack major points around the globe in less than a day. On July 3rd, the aliens all but obliterate New York, Los Angeles and Washington, as well as Paris, London, Houston and Moscow. The survivors set out in convoys towards Area 51, a strange government testing ground where it is rumored the military has a captured alien spacecraft of their own. The survivors devise a plan to fight back against the enslaving aliens, and July 4th becomes the day humanity will fight for its freedom. ",
  poster_image_url: 'http://ia.media-imdb.com/images/M/MV5BMTMwODY3NzQzNF5BMl5BanBnXkFtZTcwNzUxNjc0MQ@@._V1_.jpg',
  release_date: DateTime.new(1996, 6, 15)
) 

Movie.create!(
  title: 'The Revenant', 
  director: 'Alejandro G. Inarritu', 
  runtime_in_minutes: 156, 
  description: "While exploring the uncharted wilderness in 1823, legendary frontiersman Hugh Glass sustains injuries from a brutal bear attack. When his hunting team leaves him for dead, Glass must utilize his survival skills to find a way back home while avoiding natives on their own hunt. Grief-stricken and fueled by vengeance, Glass treks through the wintry terrain to track down John Fitzgerald, the former confidant who betrayed and abandoned him.",
  poster_image_url: 'http://ia.media-imdb.com/images/M/MV5BMjU4NDExNDM1NF5BMl5BanBnXkFtZTgwMDIyMTgxNzE@._V1_SY1000_CR0,0,674,1000_AL_.jpg',
  release_date: DateTime.new(2016, 1, 8)
)
