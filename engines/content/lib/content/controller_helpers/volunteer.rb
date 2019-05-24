module Content
  module ControllerHelpers
    module Volunteer
      def options_for_languages
        Content::Volunteer::LANGUAGE_OPTIONS.map { |language| [Content::Volunteer.human_attribute_name("languages.#{language}"), language] }
      end

      def options_for_experience_area
        Content::Volunteer::EXPERIENCE_AREA_OPTIONS.map { |experience_area| [Content::Volunteer.human_attribute_name("experience_area.#{experience_area}"), experience_area] }
      end
    end
  end
end
