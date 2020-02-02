module Ahoy
  class VisitPolicy < Content::ApplicationPolicy
    class Scope < Scope
      def resolve
        if user.super_admin?
          scope.where('landing_page ~* ?', "http(s?)://#{ENV['PROJECT_HOSTNAME']}\s*")
        elsif user.admin?
          account = user.account

          scope.where('landing_page ~* ?', "\s*(#{account.subdomain}.#{ENV['PROJECT_HOSTNAME']}|#{account.domain})\s*")
        else
          scope.none
        end
      end
    end
  end
end
