# Create super admin user
Content::User.create(
  email: Rails.application.credentials[Rails.env.to_sym][:super_admin_email],
  password: Rails.application.credentials[Rails.env.to_sym][:super_admin_password],
  role: 'super_admin',
  confirmed_at: Time.current
)
