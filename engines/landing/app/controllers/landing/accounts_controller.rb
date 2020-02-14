require_dependency 'landing/application_controller'

module Landing
  class AccountsController < ApplicationController
    def new
      @account = Content::Account.new
      @account.build_address
      @account.build_owner
    end

    def create
      @account = accounts_service.create

      if @account.persisted?
        redirect_to root_path, notice: t('landing.accounts.create.success_message')
      else
        render :new
      end
    rescue StandardError
      redirect_to root_path, alert: t('landing.accounts.create.error_message')
    end

    private

    def account_params
      params
        .require(:account)
        .permit(
          policy(%i[content account]).permitted_attributes
        ).tap do |result|
          result[:owner_attributes][:password] = Devise.friendly_token.first(8)
          result[:owner_attributes][:role] = 'admin'
        end
    end

    def accounts_service
      Landing::AccountsService.new(account_params)
    end
  end
end
