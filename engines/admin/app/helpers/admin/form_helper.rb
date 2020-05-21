module Admin
  module FormHelper
    def form_group_for(form, field, options = {}, &block)
      content_tag :div, class: 'form-group row', dir: dir do
        concat form.label(field, options[:label], class: 'col-sm-4 col-form-label')
        concat content_tag(:div, class: 'col-sm-8') { capture(&block) }
      end
    end
  end
end
