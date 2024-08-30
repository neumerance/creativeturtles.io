FactoryBot.define do
  factory :recommendation do
    user { client }
    message { FFaker::LoremIE.paragraphs.join(" ") }
  end
end
