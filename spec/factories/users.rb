FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.name }
    email                 { Faker::Internet.free_email }
    password              { '1a' + Faker::Internet.password(min_length: 4) }
    password_confirmation { password }
    height                { Faker::Number.within(range: 1..200) }
    weight                { Faker::Number.within(range: 1..200) }
    age                   { Faker::Number.within(range: 1..100) }
    sex_id                { Faker::Number.within(range: 2..4) }
  end
end
