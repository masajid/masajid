FactoryBot.define do
  factory :subscriber, class: 'Content::Subscriber' do
    email { Faker::Internet.email }
    account
  end
end
