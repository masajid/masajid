module Content
  class ArticlePolicy < ApplicationPolicy
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
      user.account == record.account
    end

    def edit?
      update?
    end

    def destroy?
      user.account == record.account
    end
  end
end
