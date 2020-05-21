class CreateTranslationForConfigurations < ActiveRecord::Migration[6.0]
  def up
    I18n.with_locale(:de) do
      Content::Configuration.create_translation_table!(
        {
          about_us: :text,
        },
        {
          migrate_data: true,
        }
      )
    end
  end

  def down
    Content::Configuration.drop_translation_table! migrate_data: true
  end
end
