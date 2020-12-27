FactoryBot.define do
  factory :todo do
    title { Faker::Lorem.word }
    target { Faker::Number.number(21) }
  end
end