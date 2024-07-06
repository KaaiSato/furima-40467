FactoryBot.define do
  factory :user do
    nickname { Faker::Name.name }
    email { Faker::Internet.email }
    password { password = Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    last_name { Gimei.name.last.kanji } # Gimei gem to generate Japanese names
    first_name { Gimei.name.first.kanji } # Gimei gem to generate Japanese names
    last_name_reading { Gimei.name.last.katakana } # Gimei gem to generate Japanese names
    first_name_reading { Gimei.name.first.katakana } # Gimei gem to generate Japanese names
    birth_date { Faker::Date.birthday(min_age: 10, max_age: 60) }
  end
end
