# Create super admin user
Content::User.create(
  email: ENV['SUPER_ADMIN_EMAIL'],
  password: ENV['SUPER_ADMIN_PASSWORD'],
  role: 'super_admin',
  confirmed_at: Time.current,
)
