FactoryBot.define do
  factory :user_show do
    title { Faker::Lorem.sentence(word_count: 3) }
    association :user
    association :show
  end
end
