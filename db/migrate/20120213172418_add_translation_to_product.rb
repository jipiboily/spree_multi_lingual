class AddTranslationToProduct < ActiveRecord::Migration
  def up
    Spree::Product.create_translation_table! :name => :string, :description => :text, :meta_description => :string, :meta_keywords => :string
  end
  def down
    Spree::Product.drop_translation_table!
  end  
end