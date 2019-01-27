module Content
  class DashboardPolicy < ::Struct.new(:user, :dashboard)
    def index?
      user.super_admin? || user.admin?
    end
  end
end