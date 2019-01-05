super_admin = Content::User.create(
  email: 'admin@theopenmasjid.com',
  password: 'theopenmasjid',
  role: 'super_admin',
)

super_admin.confirm
