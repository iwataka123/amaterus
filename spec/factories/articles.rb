FactoryBot.define do
  factory :article do
    title              {Faker::Movie.title}
    content            {Faker::Lorem.sentence}
    poster             {Faker::Name.initials(number: 2)}

    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.jpeg'), filename: 'test_image.jpeg')
    end
  end
end
