FactoryBot.define do
  factory :user do
    last_name             { Faker::Name.last_name }
    first_name            {Faker::Name.first_name}
    email                 {Faker::Internet.email}
    password              {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
  end
end