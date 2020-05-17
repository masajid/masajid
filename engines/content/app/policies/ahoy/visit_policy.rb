module Ahoy
  class VisitPolicy < Content::ApplicationPolicy
    class Scope < Scope
      # TODO: fix Metrics/AbcSize
      def resolve
        project_name = Rails.application.credentials[Rails.env.to_sym][:project_name]

        if user.super_admin?
          scope.where('landing_page ~* ?', "http(s?)://#{project_name}\s*")
        elsif user.admin?
          account = user.account

          scope.where('landing_page ~* ?', "\s*(#{account.subdomain}.#{project_name}|#{account.domain})\s*")
        else
          scope.none
        end
      end
    end
  end
end
