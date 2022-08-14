
FactoryBot.define do

  factory :offer do
    shopping_cart {create(:shopping_cart)}
    brick {  create(:brick, on_sale: true, price: 123.2) }
  end

  factory :realty do
    address { 'test rd. 123' }
  end

  factory :user do
    name { "John" }
  end

  factory :shopping_cart do
    user { create(:user) }
  end

  factory :brick do
    realty { create(:realty) }
  end

end
