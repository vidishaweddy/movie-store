json.extract! movie, :id, :title, :release_year, :price, :description, :imdb_id, :poster, :filetype, :rating, :num_copy, :created_at, :updated_at
json.url movie_url(movie, format: :json)
