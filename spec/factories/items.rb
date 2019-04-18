FactoryBot.define do
  factory :item do
    quantity { 1 }
    association :pizza, factory: :pizza
  end
end
