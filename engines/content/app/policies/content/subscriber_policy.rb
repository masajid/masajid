module Content
  class SubscriberPolicy < ApplicationPolicy
    def index?
      user.super_admin? || user.admin?
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
