class CreateTranslationForSeoContents < ActiveRecord::Migration[6.0]
  def up
    I18n.with_locale(:de) do
      Content::SeoContent.create_translation_table!(
        {
          meta_title: :string,
          meta_keywords: :string,
          meta_description: :text
        },
        {
          migrate_data: true,
        }
      )
    end
  end

  def down
    Content::SeoContent.drop_translation_table! migrate_data: true
  end
end
