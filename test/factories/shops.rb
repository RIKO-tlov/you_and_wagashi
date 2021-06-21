FactoryBot.define do
  factory :shop do
    name                    {Faker::Name.name}
    kana_name               {"ひらがな"}
    postal_code             {"1111111"}
    description             {Faker::Lorem.paragraphs(number:200)}
    address                 {Faker::Address.city}
    bussiness_start_time    {"08:00"}
    bussiness_end_time      {"17:00"}
    telephone_number        {"08099999999"}
    user
  end
end
