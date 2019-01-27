module Content
  class AccountPolicy < ApplicationPolicy
    def accept?
      super_admin_user?
    end

    def decline?
      super_admin_user?
    end
  end
end