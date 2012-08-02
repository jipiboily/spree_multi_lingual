class AddTranslationsToOptionTypes < ActiveRecord::Migration
  def up
    Spree::OptionValue.create_translation_table!(
      { :presentation => :string }, { :migrate_data => true } )
  end

  def down
    Spree::OptionValue.drop_translation_table!
  end
end