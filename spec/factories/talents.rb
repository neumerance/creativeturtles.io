FactoryBot.define do
  factory :talent do
    password { "ABC12abc" }
    password_confirmation { "ABC12abc" }
    email { FFaker::Internet.email }
    handle { FFaker::Internet.user_name }
    first_name { FFaker::Name.first_name }
    last_name { FFaker::Name.last_name }
    country { FFaker::Address.country_code }
    headline { FFaker::LoremIE.paragraph }
    about { FFaker::LoremIE.paragraphs }
  end
end
