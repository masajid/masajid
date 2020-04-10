require_dependency 'admin/application_controller'

module Admin
  class DomainsController < ApplicationController
    def update
      if current_account.update(account_params)
        redirect_to edit_domain_url, notice: t('admin.domains.update.success')
      else
        render :edit
      end
    end

    private

    def account_params
      params.require(:account).permit(:domain)
    end

    def wrapper_center?
      true
    end
    helper_method :wrapper_center?
  end
end
