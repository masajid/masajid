module Content
  class VolunteerPolicy < ApplicationPolicy
    def index?
      user.super_admin? || user.admin?
    end

    def permitted_attributes
      [
        :name, :identification, :birthday, :address, :phone, :email, :education, :availability,
        :experience, :experience_place, :other_languages, languages: [], experience_area: [],
      ]
    end

    class Scope
      attr_reader :user, :scope

      def initialize(user, scope)
        @user = user
        @scope = scope
      end

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