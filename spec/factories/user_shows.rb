FactoryBot.define do
  factory :user_show do
    association :user
    association :show
  end
end
