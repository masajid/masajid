module Admin
  module AuthenticateUserFromToken
    extend ActiveSupport::Concern

    included do
      prepend_before_action :authenticate_user_from_token
    end

    def authenticate_user_from_token
      authentication_token = params[:authentication_token].presence
      user = authentication_token && Content::User.find_by(authentication_token: authentication_token.to_s)

      return if user.blank? || user == current_user

      sign_in(user) && redirect_to(root_path)
    end
  end
end
