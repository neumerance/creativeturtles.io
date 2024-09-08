require 'open-uri'

FactoryBot.define do
  factory :product do
    name { FFaker::Product.product_name }
    price { FFaker::Number.decimal }
    product_type { 0 }
    description do 
      hash_tags = 3.times.to_a.map do |hash|
      "##{FFaker::Product.product_name.split(" ").map(&:titleize).join("")}"
      end
      (FFaker::LoremIE.paragraphs + hash_tags).join(" ")
    end
    external_link { FFaker::Internet.http_url }
    talent
    
    after(:build) do |product|
      3.times do
        image_url = "https://picsum.photos/600/800"
        image_data = URI.open(image_url)
        rewindable_io = StringIO.new(image_data.read)
        product.images.attach(io: rewindable_io, filename: "image.jpg", content_type: 'image/jpeg')
      end
    end
  end
end
