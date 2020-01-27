FactoryGirl.define do
  factory :actor, :class => 'Actor' do
    first_name           { Faker::Name.first_name}
    last_name       {Faker::Name.last_name}
    dob            { Faker::Date.birthday(17, 60)}
  end
end

FactoryGirl.define do
  factory :actors, :class => 'Actor' do
    first_name           { nil}
    last_name           { nil}
    dob            { Faker::Date.birthday(17, 60)}
  end
end
