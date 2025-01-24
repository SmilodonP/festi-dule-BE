FactoryBot.define do
  factory :show do
    date { Faker::Date.forward(from: '2025-06-06', days: 3) }

    start_time do
      Faker::Time.between(
        from: date.to_time.beginning_of_day + 12.hours, 
        to: date.to_time.beginning_of_day + 18.hours
      )
    end

    end_time do
      start_time + 90.minutes
    end

    association :artist
    association :stage
  end
end
