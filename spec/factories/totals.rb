FactoryBot.define do
  factory :total do
    start_time { Faker::Time.forward(days: 23, period: :morning) }
    working_hour { Faker::Number.between(from: 0, to: 24) }
    association :user
  end
end
