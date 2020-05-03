module Admin
  module TranslationsHelper
    def locales_for_translations
      current_account.supported_locales.reject(&:blank?)
    end

    def form_group_for_translations(form, field, options = {})
      form_input = form.input(field, hint: options[:hint], label: false, input_html: { dir: dir })

      content_tag :div, class: 'form-group row', dir: dir do
        concat form.label(field, options[:label], class: 'col-sm-4 col-form-label')
        concat content_tag(:div, class: 'col-sm-8') { form_input }
      end
    end
  end
end
