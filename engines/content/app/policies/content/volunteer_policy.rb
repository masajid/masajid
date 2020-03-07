module Content
  class VolunteerPolicy < ApplicationPolicy
    def permitted_attributes
      [
        :name, :identification, :birthday, :address, :phone, :email,
        :education, :availability, :experience, :experience_place,
        :other_languages, languages: [], experience_area: []
      ]
    end

    def index?
      user.super_admin? || user.admin?
    end

    class Scope < Scope
      def resolve
        if user.super_admin?
          scope.where(account_id: nil)
        elsif user.admin?
          scope.scoped_to(user.account)
        else
          scope.none
        end
      end
    end
  end
end
