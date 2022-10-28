FactoryBot.define do
  factory :comment do
    association :user
    association :article
    comment                 { Faker::Lorem.words }
  end
end
