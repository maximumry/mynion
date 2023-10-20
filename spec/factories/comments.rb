FactoryBot.define do
  factory :comment do
    text {Faker::Lorem.sentence}
  association :opinion
  association :user
  end
end
