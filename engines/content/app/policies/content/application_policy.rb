module Content
  class ApplicationPolicy
    attr_reader :user, :record

    def initialize(user, record)
      @user = user
      @record = record
    end

    def index?
      user.super_admin?
    end

    def show?
      user.super_admin?
    end

    def create?
      user.super_admin?
    end

    def new?
      create?
    end

    def update?
      user.super_admin?
    end

    def edit?
      update?
    end

    def destroy?
      user.super_admin?
    end

    class Scope
      attr_reader :user, :scope

      def initialize(user, scope)
        @user = user
        @scope = scope
      end

      def resolve
        if user.super_admin?
          scope.all
        elsif user.admin?
          scope.where(account_id: user.account)
        else
          scope.none
        end
      end
    end
  end
end