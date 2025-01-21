FactoryBot.define do
  factory :stage do
    name { Faker::Lorem.word.capitalize }
  end
end
