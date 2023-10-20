FactoryBot.define do
  factory :opinion do
    title {Faker::Name.name}
    text {Faker::Lorem.sentence}
    association :user

    after(:build) do |opinion|
      opinion.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
