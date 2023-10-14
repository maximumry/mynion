FactoryBot.define do
  factory :opinion do
    title {Faker::Name.name}
    text {Faker::Lorem.sentence}
    association :user
  end
end
