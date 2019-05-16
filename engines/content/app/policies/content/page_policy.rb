module Content
  class AccountPolicy < ApplicationPolicy
    def sort
      # record.entity.owner == user
      true
    end
  end
end