FactoryGirl.define do
  factory :movie, :class => 'Movie' do
    title         { Faker::Book.title }
    release_year  { '2000' }
    price         { '1.00' }
    description   { Faker::Lorem.paragraphs(1) }
    imdb_id       { Faker::Internet.domain_word}
    quantity      { '1' }
    filetype      { Faker::File.extension }
    rating        { '9.0' }
  end
end

FactoryGirl.define do
  factory :movie2, :class => 'Movie' do
    title 'A'
    release_year 2000
    price 1
    description 'ABCD'
    imdb_id 'A1B2'
    quantity 1
    filetype 'DVD'
    rating 9
  end
end
