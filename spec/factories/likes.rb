FactoryBot.define do
  factory :like do
    association :user
    association :opinion
  end
end
