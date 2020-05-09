module Content
  module HasPhoto
    extend ActiveSupport::Concern

    included do
      has_one_attached :photo

      attribute :remove_photo, :boolean

      after_save :purge_photo, if: :remove_photo
    end

    private

    def purge_photo
      photo.purge_later
    end
  end
end
