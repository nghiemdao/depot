FactoryBot.define do
  factory :order do
    name { Faker::Name.name }
    address { "#{Faker::Address.city} #{Faker::Address.street_name} 
               #{Faker::Address.street_address}" }
    email { Faker::Internet.email }
    pay_type Order.pay_types.keys.first
  end
end
