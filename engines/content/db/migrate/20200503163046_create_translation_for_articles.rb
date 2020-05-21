class CreateTranslationForArticles < ActiveRecord::Migration[6.0]
  def up
    I18n.with_locale(:de) do
      Content::Article.create_translation_table!(
        {
          title: :string,
          slug: :string,
          summary: :text,
          body: :text
        },
        {
          migrate_data: true,
        }
      )
    end
  end

  def down
    Content::Article.drop_translation_table! migrate_data: true
  end
end
