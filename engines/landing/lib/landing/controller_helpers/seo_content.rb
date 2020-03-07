module Landing
  module ControllerHelpers
    module SeoContent
      extend ActiveSupport::Concern

      included do
        include ActionView::Helpers::TagHelper

        helper_method :title
        helper_method :meta_description_tag
      end

      def title
        if accurate_title_present?
          if put_site_name_in_title?
            [t('shared.site_name'), accurate_title].join(' - ')
          else
            accurate_title
          end
        else
          t('shared.site_name')
        end
      end

      def meta_description_tag
        return unless meta_description_present?

        tag(:meta, name: :description, content: t("landing.#{controller_name}.#{action_name}.meta_description"))
      end

      private

      def accurate_title
        t("landing.#{controller_name}.#{action_name}.title")
      end

      def accurate_title_present?
        I18n.exists?("landing.#{controller_name}.#{action_name}.title", I18n.locale)
      end

      def meta_description_present?
        I18n.exists?("landing.#{controller_name}.#{action_name}.meta_description", I18n.locale)
      end

      def put_site_name_in_title?
        true
      end
    end
  end
end
