class AddTranslationsToContentChunks < ActiveRecord::Migration
  def up
    Spree::ContentChunk.create_translation_table!(:title => :string, :body => :text)
  end

  def down
    Spree::ContentChunk.drop_translation_table!
  end
end
