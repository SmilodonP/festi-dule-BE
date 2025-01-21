FactoryBot.define do
  factory :show do
    date { Faker::Date.forward(days: 30) }
    start_time { Faker::Time.forward(days: 0, period: :afternoon).strftime('%H:%M:%S') }
    end_time { (Time.parse(start_time) + 90.minutes).strftime('%H:%M:%S') }
    association :artist
    association :stage
  end
end

