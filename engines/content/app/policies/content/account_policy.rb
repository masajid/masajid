module Content
  class AccountPolicy < ApplicationPolicy
    def accept?
      user.super_admin?
    end

    def decline?
      user.super_admin?
    end
  end
end
