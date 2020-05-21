class CreateTranslationForSidebarContents < ActiveRecord::Migration[6.0]
  def up
    I18n.with_locale(:de) do
      Content::SidebarContent.create_translation_table!(
        {
          title: :string,
          body: :text,
        },
        {
          migrate_data: true,
        }
      )
    end
  end

  def down
    Content::SidebarContent.drop_translation_table! migrate_data: true
  end
end
