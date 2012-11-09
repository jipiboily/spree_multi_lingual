# This migration comes from spree_multi_lingual (originally 20121029125321)
class AddTranslationToShippingMethod < ActiveRecord::Migration
  def up
    change_table :spree_shipping_methods do |t|
       t.text :description
    end
    Spree::ShippingMethod.reset_column_information
    Spree::ShippingMethod.create_translation_table! ( { :name => :string, :description => :text }, { :migrate_data => true } )
  end
  def down
    Spree::ShippingMethod.drop_translation_table!
    change_table :spree_shipping_methods do |t|
       t.remove :description
    end
  end  
end
