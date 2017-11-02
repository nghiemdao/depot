FactoryBot.define do
  factory :product do
    title       { Faker::Commerce.product_name }
    description { Faker::Lorem.paragraph(3) }
    image_url   "7apps.jpg"
    price       { Faker::Commerce.price }
  end
end
