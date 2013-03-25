
FactoryGirl.define do
  factory :category, :class => Refinery::Stores::Category do
    sequence(:name) { |n| "refinery-category#{n}" }
  end
end

