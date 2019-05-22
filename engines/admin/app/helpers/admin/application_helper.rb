module Admin
  module ApplicationHelper
    def plural_resource_name(resource_class)
      resource_class.model_name.human(count: 2)
    end
  end
end
