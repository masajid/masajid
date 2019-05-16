module Content
  class Page < ApplicationRecord
    acts_as_nested_set
  end
end
