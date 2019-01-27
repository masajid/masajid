require_dependency 'admin/application_controller'

module Admin
  class AccountsController < ApplicationController
    before_action :set_account, except: :index

    def index
      authorize Content::Account

      @accounts = policy_scope(Content::Account)
        .includes(:owner, address: [:city, :country])
        .order('content_accounts.created_at DESC')
    end

    def update
      if @account.update(account_params)
        redirect_to accounts_url, notice: 'Account was successfully updated.'
      else
        render :edit
      end
    end

    def destroy
      @account.destroy
      redirect_to accounts_url, notice: 'Account was successfully destroyed.'
    end

    def accept
      @account.accepted!
      Content::AccountMailer.accept_email(@account).deliver_later
      redirect_to accounts_url, notice: 'Account was successfully accepted.'
    end

    def decline
      @account.declined!
      Content::AccountMailer.decline_email(@account).deliver_later
      redirect_to accounts_url, notice: 'Account was successfully declined.'
    end

    private
      def set_account
        @account = authorize Content::Account.find(params[:id])
      end

      def account_params
        params.require(:account).permit(
          :subdomain,
          :email,
          :mosque,
          :responsable,
          address_attributes: %i[id address1 zip_code phone city_id region_id country_id]
        )
      end
  end
end
