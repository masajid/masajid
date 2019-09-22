require_dependency 'landing/application_controller'

module Landing
  class AccountsController < ApplicationController
    def new
      @account = Content::Account.new
      @account.build_address
    end

    def create
      @account = Content::Account.new(account_params)

      if @account.save
        redirect_to root_path, notice: 'Account created'
      else
        render :new
      end
    end

    private

    def account_params
      params.require(:account).permit(
        :subdomain,
        :email,
        :mosque,
        :responsable,
        address_attributes: %i[address1 zip_code phone city_name region_name country_id]
      )
    end
  end
end
