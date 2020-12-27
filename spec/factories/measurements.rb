FactoryBot.define do
  factory :measurement do
    height { Faker::Number.number(180) }
    weight { Faker::Number.number(70) }
    bmi nil
    program_id nil
  end
end