FactoryBot.define do
  factory :artist do
    name { Faker::Music.unique.band }
  end
end
