namespace :one_time do
  task fix_spanish_translations: :environment do
    account_id = 2

    # Account
    ActiveRecord::Base.connection.execute("
      UPDATE content_account_translations
      SET locale = 'es'
      WHERE content_account_id = #{account_id}
    ")

    # Configuration
    ActiveRecord::Base.connection.execute("
      UPDATE content_configuration_translations
      SET locale = 'es'
      FROM content_configurations
      WHERE content_configuration_translations.content_configuration_id = content_configurations.id
      AND content_configurations.account_id = #{account_id}
    ")

    # SidebarContents
    ActiveRecord::Base.connection.execute("
      UPDATE content_sidebar_content_translations
      SET locale = 'es'
      FROM content_sidebar_contents
      WHERE content_sidebar_content_translations.content_sidebar_content_id = content_sidebar_contents.id
      AND content_sidebar_contents.account_id = #{account_id}
    ")

    # Sliders
    ActiveRecord::Base.connection.execute("
      UPDATE content_slider_translations
      SET locale = 'es'
      FROM content_sliders
      WHERE content_slider_translations.content_slider_id = content_sliders.id
      AND content_sliders.account_id = #{account_id}
    ")

    # Articles
    ActiveRecord::Base.connection.execute("
      UPDATE content_article_translations
      SET locale = 'es'
      FROM content_articles
      WHERE content_article_translations.content_article_id = content_articles.id
      AND content_articles.account_id = #{account_id}
    ")

    # Pages
    ActiveRecord::Base.connection.execute("
      UPDATE content_page_translations
      SET locale = 'es'
      FROM content_pages
      WHERE content_page_translations.content_page_id = content_pages.id
      AND content_pages.account_id = #{account_id}
    ")

    ActiveRecord::Base.connection.execute("
      WITH t AS (
        SELECT content_seo_contents.id
        FROM content_seo_contents
        JOIN content_pages ON content_pages.id = content_seo_contents.searchable_id
        WHERE content_pages.account_id = #{account_id}
        AND content_seo_contents.searchable_type = 'Content::Page'
      )

      UPDATE content_seo_content_translations
      SET locale = 'es'
      FROM t
      WHERE content_seo_content_translations.content_seo_content_id = t.id
    ")
  end
end
