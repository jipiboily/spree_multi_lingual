# This migration comes from spree_multi_lingual (originally 20120802202113)
class AddTranslationsToOptionValues < ActiveRecord::Migration
  def up
    Spree::OptionValue.create_translation_table!(
      { :presentation => :string }, { :migrate_data => true } )
  end

  def down
    Spree::OptionValue.drop_translation_table!
  end
end