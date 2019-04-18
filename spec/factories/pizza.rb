FactoryBot.define do
  factory :pizza do
    name { Faker::Name.first_name  }
    price { 0.99 }
  end
end
