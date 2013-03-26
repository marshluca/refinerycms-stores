# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :variant do
    sku "MyString"
    price "9.99"
    weight "9.99"
    height "9.99"
    width "9.99"
    depth "9.99"
    is_master false
    deleted_at "2013-03-26 09:43:02"
    product nil
    count_on_hand 1
    cost_price "9.99"
    position 1
  end
end
