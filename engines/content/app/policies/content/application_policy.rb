module Content
  class ApplicationPolicy
    attr_reader :user, :record

    def initialize(user, record)
      @user = user
      @record = record
    end

    def index?
      super_admin_user?
    end

    def show?
      super_admin_user?
    end

    def create?
      super_admin_user?
    end

    def new?
      create?
    end

    def update?
      super_admin_user?
    end

    def edit?
      update?
    end

    def destroy?
      super_admin_user?
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
          scope.where(account: user.account)
        else
          scope.none
        end
      end
    end

    private

    def super_admin_user?
      @super_admin_user ||= user.super_admin?
    end
  end
end