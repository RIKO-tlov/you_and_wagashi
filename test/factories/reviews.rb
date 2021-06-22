FactoryBot.define do
  factory :review do
    product_name                    {Faker::Name.name}
    comment                         {Faker::Lorem.paragraphs(number:200)}
    rate                            {5}
  end
end
