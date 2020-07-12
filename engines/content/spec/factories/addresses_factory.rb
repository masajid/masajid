FactoryBot.define do
  factory :address, class: 'Content::Address' do
    phone { Faker::PhoneNumber.cell_phone }
    address1 { 'Sievekingsallee 191' }
    city_name { 'Hamburg' }
    region_name { 'Hamburg' }
    association :addressable, factory: :account
    country
  end
end
