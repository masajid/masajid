FactoryBot.define do
  factory :configuration, class: 'Content::Configuration' do
    supported_locales { %w[en ar] }
    admin_locale { 'en' }
    default_locale { 'en' }
    account
  end
end
