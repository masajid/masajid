require_dependency "admin/application_controller"

module Admin
  class AccountsController < ApplicationController
    before_action :set_account, only: [:show, :edit, :update, :destroy]

    def index
      @accounts = Content::Account.all
    end

    def show
    end

    def new
      @account = Content::Account.new
    end

    def edit
    end

    def create
      @account = Content::Account.new(account_params)

      if @account.save
        redirect_to @account, notice: 'Account was successfully created.'
      else
        render :new
      end
    end

    def update
      if @account.update(account_params)
        redirect_to @account, notice: 'Account was successfully updated.'
      else
        render :edit
      end
    end

    def destroy
      @account.destroy
      redirect_to accounts_url, notice: 'Account was successfully destroyed.'
    end

    private
      def set_account
        @account = Content::Account.find(params[:id])
      end

      def account_params
        params.require(:account).permit(:subdomain, :email, :mosque, :responsable, :owner_id, :address_id)
      end
  end
end
