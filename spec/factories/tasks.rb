FactoryBot.define do
  factory :task do
    name { Faker::Lorem.sentence }
    time_required_id { Faker::Number.between(from: 1, to: 11) }
    implementation_date { Faker::Date.in_date_period }
    dead_line_date { Faker::Time.forward(days: 23, period: :morning) }
    operator_id { Faker::Number.between(from: 1, to: 10) }
    association :user
  end
end
