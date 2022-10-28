FactoryBot.define do
  factory :favor do
    association :user
    association :article
  end
end
