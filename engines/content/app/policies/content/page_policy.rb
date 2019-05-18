module Content
  class PagePolicy < ApplicationPolicy
    def sort?
      # record.account.owner == user
      true
    end

    def index?
      user.super_admin? || user.admin?
    end
  end
end
