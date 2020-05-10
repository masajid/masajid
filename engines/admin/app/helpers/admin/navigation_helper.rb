module Admin
  module NavigationHelper
    def link_to_translate(url, text: t('shared.actions.translate'), only_icon: false)
      link_to url, class: 'btn btn-primary' do
        concat content_tag(:i, nil, class: 'fa fa-globe', title: (text if only_icon))
        concat text unless only_icon
      end
    end
  end
end
