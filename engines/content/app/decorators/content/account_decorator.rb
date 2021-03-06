module Content
  class AccountDecorator < ApplicationDecorator
    delegate_all

    def display_address
      [
        object.address1,
        [object.zip_code, object.city_name].join(', '),
        object.country.name
      ].compact.join("\n")
    end

    def coordinates
      [object.longitude, object.latitude]
    end
  end
end
