FactoryBot.define do
  factory :comment do
    text {Faker::Lorem.sentence}
  association :opinion
  end
end
