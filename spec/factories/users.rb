FactoryBot.define do
  factory :user do
<<<<<<< Updated upstream
    last_name             { Faker::Name.last_name }
    first_name            {Faker::Name.first_name}
=======
    last_name             {Faker::Japanese::Name.last_name}
    first_name            {Faker::Japanese::Name.first_name}
>>>>>>> Stashed changes
    email                 {Faker::Internet.email}
    password              {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
  end
end