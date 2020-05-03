class CreateTranslationForPages < ActiveRecord::Migration[6.0]
  def up
    I18n.with_locale(:de) do
      Content::Page.create_translation_table!(
        {
          name: :string,
          description: :text
        },
        {
          migrate_data: true,
          remove_source_columns: true
        }
      )
    end
  end

  def down
    Content::Page.drop_translation_table! migrate_data: true
  end
end
