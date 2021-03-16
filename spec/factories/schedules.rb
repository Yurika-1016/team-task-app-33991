FactoryBot.define do
  factory :schedule do
    date { Faker::Time.forward(days: 23, period: :morning) }
    time_limit_id { Faker::Number.between(from: 0, to: 11) }
    association :user
  end
end
