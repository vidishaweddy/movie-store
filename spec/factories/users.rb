FactoryGirl.define do
  factory :users, :class => 'User' do
    email          { Faker::Internet.email}
    first_name         { Faker::Name.first_name}
    last_name         { Faker::Name.last_name}
    address        { Faker::Address.street_address}
    age            { Faker::Number.between(17, 60)}
    dob            { Faker::Date.birthday(17, 60)}
    password '*Abcd123456'
    admin false
  end
end

FactoryGirl.define do
  sequence :email do |n|
    "person#{n}@example.com"
  end
end

FactoryGirl.define do
  factory :user, :class => 'User' do
    email
    first_name         { Faker::Name.first_name}
    last_name         { Faker::Name.last_name}
    password '*Abcd123456'
    password_confirmation '*Abcd123456'
    admin false
  end
end

FactoryGirl.define do
  factory :admin, :class => 'User' do
    email
    first_name         { Faker::Name.first_name}
    last_name         { Faker::Name.last_name}
    password '*Abcd123456'
    password_confirmation '*Abcd123456'
    admin true
  end
end
