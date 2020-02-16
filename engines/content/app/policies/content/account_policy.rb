module Content
  class AccountPolicy < ApplicationPolicy
    def permitted_attributes
      [
        :subdomain,
        :mosque,
        :responsable,
        owner_attributes: %i[id email],
        address_attributes: %i[id address1 zip_code phone city_name region_name country_id]
      ]
    end

    def accept?
      user.super_admin?
    end

    def decline?
      user.super_admin?
    end
  end
end
