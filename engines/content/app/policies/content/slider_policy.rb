module Content
  class SliderPolicy < ApplicationPolicy
    def update?
      user.super_admin? || user.account == record.account
    end

    def edit?
      update?
    end
  end
end
