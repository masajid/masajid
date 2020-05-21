class CreateTranslationForAccounts < ActiveRecord::Migration[6.0]
  def up
    I18n.with_locale(:de) do
      Content::Account.create_translation_table!(
        {
          mosque: :string,
        },
        {
          migrate_data: true,
        }
      )
    end
  end

  def down
    Content::Account.drop_translation_table! migrate_data: true
  end
end
