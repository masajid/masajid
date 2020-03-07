module Ahoy
  class VisitPolicy < Content::ApplicationPolicy
    class Scope < Scope
      def resolve
        if user.super_admin?
          # TODO: only visit from landing page
          scope.all
        elsif user.admin?
          # TODO: use ahoy referrer and match account domain as well
          scope.where('landing_page LIKE ?', "%#{user.account.subdomain}%")
        else
          scope.none
        end
      end
    end
  end
end
