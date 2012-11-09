class AddTranslationToImage < ActiveRecord::Migration
  def up
    Spree::Image.create_translation_table! ( { :alt => :string }, { :migrate_data => true } )
  end
  def down
    Spree::Image.drop_translation_table!
  end  
end
