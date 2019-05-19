module Content
  class ArticlePolicy < ApplicationPolicy
    def index?
      user.super_admin? || user.admin?
    end

    def create?
      user.super_admin? || user.admin?
    end

    def new?
      create?
    end

    def update?
      user.super_admin? || user.account == record.account
    end

    def edit?
      update?
    end

    def destroy?
      user.super_admin? || user.account == record.account
    end
  end
end
