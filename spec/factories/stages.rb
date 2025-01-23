FactoryBot.define do
  factory :stage do
    name { Faker::Cosmere.unique.allomancer }
  end
end
