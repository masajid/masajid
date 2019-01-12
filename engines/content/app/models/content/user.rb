module Content
  class User < ApplicationRecord
    # Include default devise modules. Others available are:
    # :lockable, :timeoutable and :omniauthable
    devise :database_authenticatable, :registerable,
           :recoverable, :rememberable, :validatable,
           :trackable, :confirmable

    ROLE_NAMES = %w[super_admin admin user]

    validates :role, inclusion: { in: ROLE_NAMES }
  end
end
