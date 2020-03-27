module Content
  class SidebarContentPolicy < ApplicationPolicy
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
      update?
    end
  end
end
