FactoryBot.define do
  factory :golfer do
    association :user
    average_score_id     { Faker::Number.within(range: 2..7) }
    dominant_hand_id      { Faker::Number.within(range: 2..3) }
    type_id               { Faker::Number.within(range: 2..7) }
    golf_history_id       { Faker::Number.within(range: 2..6) }
    worries               { Faker::Lorem.sentence }
    feature               { Faker::Lorem.sentence }
    average_putt          { Faker::Number.within(range: 0..100) }
  end
end
