class AddTranslationToPromotions < ActiveRecord::Migration
  def up
    Spree::Promotion.create_translation_table!( { :name => :string, :description => :string, :code => :string, :path => :string }, { :migrate_data => true } )
  end
  def down
    Spree::Promotion.drop_translation_table!
  end
end
