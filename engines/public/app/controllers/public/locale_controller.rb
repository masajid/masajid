require_dependency 'public/application_controller'

module Public
  class LocaleController < ApplicationController
    def set
      I18n.locale = params[:switch_to_locale]

      redirect_to root_url
    end
  end
end
