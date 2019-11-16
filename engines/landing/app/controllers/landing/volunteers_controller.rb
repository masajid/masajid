require_dependency 'landing/application_controller'

module Landing
  class VolunteersController < ApplicationController
    helper Content::ControllerHelpers::Volunteer

    def new
      @volunteer = Content::Volunteer.new
    end

    def create
      @volunteer = Content::Volunteer.new(volunteer_params)

      if @volunteer.save
        redirect_to new_volunteer_url, notice: 'Volunteer was successfully created.'
      else
        render :new
      end
    end

    private

    def volunteer_params
      params.require(:volunteer).permit(policy([:content, :volunteer]).permitted_attributes)
    end
  end
end
