require_dependency 'admin/application_controller'

module Admin
  class UsersController < ApplicationController
    def update
      if current_user.update_with_password(user_params)
        bypass_sign_in(current_user)

        redirect_to edit_user_path
      else
        render :edit
      end
    end

    private

    def user_params
      params.require(:user).permit(:email, :current_password, :password, :password_confirmation)
    end
  end
end
