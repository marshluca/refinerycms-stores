
FactoryGirl.define do
  factory :product, :class => Refinery::Stores::Product do
    sequence(:title) { |n| "refinery-product#{n}" }
    sequence(:description) { |n| "refinery-description#{n}" }
  end
end

