module Public
  module ControllerHelpers
    module SeoContent
      extend ActiveSupport::Concern

      included do
        include ActionView::Helpers::TagHelper

        helper_method :title
        helper_method :meta_data_tags
      end

      def title
        if accurate_title
          if put_site_name_in_title?
            [accurate_title, current_account.mosque].join(' - ')
          else
            accurate_title
          end
        else
          current_account.mosque
        end
      end

      def meta_data_tags
        meta_data.map do |name, content|
          tag(:meta, name: name, content: content)
        end.join('\n')
      end

      private

      def accurate_title
        @accurate_title ||= current_account.meta_title
      end

      def put_site_name_in_title?
        false
      end

      def meta_data
        object = instance_variable_get('@' + controller_name.singularize)
        meta = {}

        if object.respond_to?(:meta_description) && object.meta_description.present?
          meta[:description] = object.meta_description
        end

        if meta[:description].blank?
          meta[:description] = current_account.meta_description
        end

        meta
      end
    end
  end
end
