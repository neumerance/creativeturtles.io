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

    after(:build) do |talent|
      3.times do
        image_url = "https://picsum.photos/600/800"
        image_data = URI.open(image_url)
        rewindable_io = StringIO.new(image_data.read)
        talent.photo.attach(io: rewindable_io, filename: "image.jpg", content_type: 'image/jpeg')
      end
    end
  end
end
