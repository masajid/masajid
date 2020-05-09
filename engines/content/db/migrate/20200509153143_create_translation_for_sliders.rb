class CreateTranslationForSliders < ActiveRecord::Migration[6.0]
  def up
    I18n.with_locale(:de) do
      Content::Slider.create_translation_table!(
        {
          title: :string,
          body: :text,
          link: :string,
          link_text: :string,
        },
        {
          migrate_data: true,
          remove_source_columns: true
        }
      )
    end
  end

  def down
    Content::Slider.drop_translation_table! migrate_data: true
  end
end
