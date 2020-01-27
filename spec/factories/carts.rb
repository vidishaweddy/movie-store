FactoryGirl.define do
  factory :cart do
    quantity      { '1' }
    rent_at       { Faker::Time.between(DateTime.now, DateTime.now) }
    return_at     { Faker::Time.between(DateTime.now + 2, DateTime.now + 2) }
    movie_id 1
    user_id 1
  end
end
