FactoryBot.define do
  factory :line_item do
    association :cart
    association :product
    order nil
  end
end
