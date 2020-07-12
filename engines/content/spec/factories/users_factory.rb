FactoryBot.define do
  factory :user, class: 'Content::User' do
    email { Faker::Internet.email }
    password { Faker::Internet.password }

    trait :super_admin do
      role { 'super_admin' }
    end

    trait :admin do
      role { 'admin' }
    end

    trait :user do
      role { 'user' }
    end
  end
end
