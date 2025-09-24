# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

Movie.delete_all

# Seed the RottenPotatoes DB with some movies.
more_movies = [
  { title: 'My Neighbor Totoro', rating: 'G',
    release_date: '16-Apr-1988' },
  { title: 'Green Book', rating: 'PG-13',
    release_date: '16-Nov-2018' },
  { title: 'Parasite', rating: 'R',
    release_date: '30-May-2019' },
  { title: 'Nomadland', rating: 'R',
    release_date: '19-Feb-2021' },
  { title: 'CODA', rating: 'PG-13',
    release_date: '13-Aug-2021' },
  { title: 'Ratatouille', rating: 'G',
    release_date: '29-Jun-2007' },
  { title: 'Toy Story', rating: 'G',
    release_date: '22-Nov-1995' },
  { title: 'Jumanji', rating: 'PG',
    release_date: '15-Dec-1995' },
  { title: 'Iron Man', rating: 'PG-13',
    release_date: '02-May-2008' },
  { title: 'Marvel\'s The Avengers', rating: 'PG-13',
    release_date: '04-May-2012' },
  { title: 'Ford v Ferrari', rating: 'PG-13',
    release_date: '15-Nov-2019' }
]

more_movies.each do |movie_attributes|
  movie = Movie.find_or_initialize_by(title: movie_attributes[:title])

  movie.update!(
    rating: movie_attributes[:rating],
    description: movie_attributes[:description]
  )
end
