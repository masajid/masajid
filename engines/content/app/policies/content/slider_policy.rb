module Content
  class SliderPolicy < ApplicationPolicy
    def update?
      user.account == record.account
    end

    def edit?
      update?
    end
  end
end
