FactoryBot.define do
  factory :user do
    email                           {Faker::Internet.free_email}
    password                        {'111111'}
    password_confirmation           {'111111'}
    name                            {Faker::Name.name}
    birthdate                       {"2000-01-01"}
    age                             {23}
    sex                             {1}

  end
end
