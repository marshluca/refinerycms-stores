
FactoryGirl.define do
  factory :store, :class => Refinery::Stores::Store do
    sequence(:title) { |n| "refinery#{n}" }
  end
end

