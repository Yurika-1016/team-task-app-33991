FactoryBot.define do
  factory :user do
    transient do
      person { Gimei.name }
    end

    last_name { person.last.kanji }
    first_name { person.first.kanji }
    position { true }
    email { Faker::Internet.email }
    password { Faker::Lorem.characters(number: 6) }
    password_confirmation { password }

    after(:build) do |message|
      message.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
