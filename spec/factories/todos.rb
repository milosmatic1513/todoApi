FactoryBot.define do
  factory :todo do
    title { Faker::Lorem.word }
    created_by { Faker::Lorem.name }
    user_id { 1 }
  end
end
