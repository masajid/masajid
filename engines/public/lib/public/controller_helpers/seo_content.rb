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
        accurate_title || current_account.mosque
      end

      def meta_data_tags
        meta_data.map do |name, content|
          tag(:meta, name: name, content: content)
        end.join('\n')
      end

      private
        def accurate_title
          current_account.meta_title
        end

        def meta_data
          object = instance_variable_get('@' + controller_name.singularize)
          meta = {}

          if object.is_a?(ActiveRecord::Base)
            meta[:description] = object.meta_description if object[:meta_description].present?
          end

          if meta[:description].blank?
            meta[:description] = current_account.meta_description
          end

          meta
        end
    end
  end
end
