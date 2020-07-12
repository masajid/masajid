FactoryBot.define do
  factory :account, class: 'Content::Account' do
    subdomain { Faker::Internet.domain_word }
    mosque { Faker::Name.name }
    responsable { Faker::Name.name }
    association :owner, factory: %i[user admin]

    after(:build) do |record|
      record.address ||= build(:address, addressable: record, country: create(:country))
      record.configuration ||= build(:configuration, account: record)
    end
  end
end
