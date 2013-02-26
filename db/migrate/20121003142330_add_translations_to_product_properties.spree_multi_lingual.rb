# This migration comes from spree_multi_lingual (originally 20121003141232)
class AddTranslationsToProductProperties < ActiveRecord::Migration
  def up
    Spree::ProductProperty.create_translation_table!(
      { :value => :string }, { :migrate_data => true } )
  end

  def down
    Spree::ProductProperty.drop_translation_table!
  end
end