FactoryBot.define do
  factory :visit do
    association :shop
    association :user
  end
end
