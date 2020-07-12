module Content
  DashboardPolicy = Struct.new(:user, :dashboard) do
    def index?
      user.super_admin? || user.admin?
    end
  end
end
