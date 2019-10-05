module Content
  class NewsletterPolicy < ApplicationPolicy
    def index?
      user.admin?
    end

    def create?
      user.admin?
    end

    def new?
      create?
    end

    def update?
      user.account == record.account && !record.readonly?
    end

    def edit?
      user.account == record.account
    end

    def destroy?
      user.account == record.account
    end
  end
end
