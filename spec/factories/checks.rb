FactoryBot.define do
  factory :check do
    association :user
    association :article
  end
end