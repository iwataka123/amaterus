FactoryBot.define do
  factory :schedule do
    title              {Faker::Movie.title}
    content            {Faker::Lorem.sentence}
    start_time         {DateTime.now}
    completed          {'0'}
    
    association :user
  end
end