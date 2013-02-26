class AddTranslationsToVideos < ActiveRecord::Migration
  def up
    Spree::Video.create_translation_table!(:youtube_ref => :string)
  end

  def down
    Spree::Video.drop_translation_table!
  end
end
