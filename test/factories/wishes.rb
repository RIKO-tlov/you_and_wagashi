FactoryBot.define do
  factory :wish do
    association :user
    association :shop
  end
end
