module Admin
  module PagesHelper
    def options_for_pages
      policy_scope(Content::Page).leaves.map { |leaf| [leaf.pretty_name, leaf.id] }
    end
  end
end
