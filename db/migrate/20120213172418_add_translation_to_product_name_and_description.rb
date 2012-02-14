class AddTranslationToProductNameAndDescription < ActiveRecord::Migration
  def up
    Spree::Product.create_translation_table! :name => :string, :description => :text
  end
  def down
    Spree::Product.drop_translation_table!
  end  
end