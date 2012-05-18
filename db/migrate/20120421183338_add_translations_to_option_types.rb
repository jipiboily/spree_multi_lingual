class AddTranslationsToOptionTypes < ActiveRecord::Migration
  def up
    Spree::OptionType.create_translation_table!({:presentation => :string},
    {:migrate_data => true})
  end

  def down
    Spree::OptionType.drop_translation_table!
  end
end