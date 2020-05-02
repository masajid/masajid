module Content
  module HasImage
    extend ActiveSupport::Concern

    included do
      has_one_attached :photo

      attr_accessor :remove_photo

      after_save :purge_photo, if: :remove_photo
    end

    private

    def purge_photo
      photo.purge_later
    end
  end
end
