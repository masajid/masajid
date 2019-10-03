module Ahoy
  class Visit < ActiveRecord::Base
    self.table_name = 'ahoy_visits'

    has_many :events
    belongs_to :user, class_name: 'Content::User', optional: true
  end
end
