class AccountsController < ApplicationController
  def create
    @account = Content::Account.new(account_params)

    if @account.save
      head :created
    else
      render json: @account.errors, status: :unprocessable_entity
    end
  end

  private

  def account_params
    params.require(:account).permit(
      :subdomain,
      :email,
      :mosque,
      :responsable,
      address_attributes: %i[street zipcode phone content_city_id content_region_id content_country_id]
    )
  end
end
