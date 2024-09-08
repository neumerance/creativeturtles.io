FactoryBot.define do
  factory :user_preference do
    country { FFaker::Address.country_code }
    currency { FFaker::Currency.code }
    language { FFaker::Locale.code }
    timezone { FFaker::Address.time_zone }
  end
end
