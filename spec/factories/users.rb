FactoryBot.define do
  factory :user do
    name Faker::Name.name
    password Faker::Internet.password(8)
    password_confirmation { |u| u.password }
  end
end
