module Content
  class SocialNetworkPolicy < ApplicationPolicy
    def update?
      user.super_admin? || user.account == record.account
    end

    def edit?
      update?
    end
  end
end
