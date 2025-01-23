FactoryBot.define do
  factory :show do
    date { Faker::Date.forward(days: 100) }

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
