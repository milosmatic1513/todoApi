FactoryBot.define do
  factory :user do

    email { Faker::Lorem.name }
    password { '123' }
    id {1}
  end
end
