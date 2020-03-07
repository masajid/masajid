module Content
  class Account < ApplicationRecord
    belongs_to :owner, class_name: 'Content::User'
    has_one :address, as: :addressable
    has_one :seo_content, as: :searchable
    has_one :configuration
    has_one :slider
    has_one :social_network

    enum status: %i[pending accepted declined]

    validates :subdomain, presence: true, uniqueness: true
    validates :mosque, presence: true
    validates :responsable, presence: true
    validates :owner, presence: true
    validates :address, presence: true

    accepts_nested_attributes_for :owner, :address, :seo_content, :configuration

    delegate :email, to: :owner
    delegate :address1, :zip_code, :city_name, :country, :phone, :latitude, :longitude, to: :address
    delegate :meta_title, :meta_description, to: :seo_content, allow_nil: true
    delegate :logo, :about_us, :mawaqit_link, :supported_locales, :default_locale, :admin_locale, to: :configuration
  end
end
