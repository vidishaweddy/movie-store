FactoryGirl.define do
  factory :genre, :class => 'Genre' do
    name         { Faker::Book.genre}
  end
end
