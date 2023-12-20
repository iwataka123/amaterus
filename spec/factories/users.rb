FactoryBot.define do
  factory :user do
    name                  {Faker::Name.initials(number: 2)}
    unique_user_id        {'000001'}
    password              {'1a' + Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    department_id         {'2'}
    position_id           {'2'}
  end
end