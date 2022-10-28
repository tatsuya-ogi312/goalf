FactoryBot.define do
  factory :article do
    association :user
    title                 { Faker::Lorem.words }
    content               { Faker::Lorem.sentence }
    url                   { Faker::Lorem.sentence }
    category_id           { Faker::Number.within(range: 2..7) }

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/item-sample.png'), filename: 'item-sample.png')
    end

  end
end
