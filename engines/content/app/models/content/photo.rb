module Content
  class Photo < ApplicationRecord
    include ImageUploader[:image]
  end
end
