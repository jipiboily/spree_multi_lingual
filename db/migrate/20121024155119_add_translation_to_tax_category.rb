class AddTranslationToTaxCategory < ActiveRecord::Migration
  def up
    Spree::TaxCategory.create_translation_table! :name => :string
  end
  def down
    Spree::TaxCategory.drop_translation_table!
  end  
end
