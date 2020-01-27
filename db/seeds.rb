admin = User.create_with(password: 'password', admin: true, first_name: 'admin', last_name: 'store')
          .find_or_initialize_by(email: 'test@movie.com')
admin.save(validate: false)

require 'csv'
CSV.foreach(Rails.root.join("db/seeds_data/movies.csv"), headers: true) do |row|
  Movie.find_or_create_by(title: row[1], release_year: row[2], price_cents: row[11], description: row[3],
                          imdb_id: row[4], poster: row[5],
  created_at: row[6], updated_at: row[7], rating: row[8], quantity: row[9], filetype: row[10])
end

CSV.foreach(Rails.root.join("db/seeds_data/genres.csv"), headers: true) do |row|
  Genre.find_or_create_by(name: row[1])
end
