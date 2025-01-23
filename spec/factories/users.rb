FactoryBot.define do
  factory :user do
    first_name { Faker::Name.neutral_first_name }
    last_name { Faker::Name.last_name }
    email { Faker::Internet.unique.email }
    username { Faker::Esport.unique.player }
  end
end