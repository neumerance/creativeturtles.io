FactoryBot.define do
  factory :product do
    name { FFaker::Product.product_name }
    price { FFaker::Number.decimal }
    product_type { 0 }
    description { FFaker::LoremIE.paragraphs }
    external_link { FFaker::Internet.http_url }
    talent
  end
end
