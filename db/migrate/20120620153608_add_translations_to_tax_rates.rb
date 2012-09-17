class AddTranslationsToTaxRates < ActiveRecord::Migration
  def up
    Spree::TaxRate.create_translation_table!({:name => :string},
      {:migrate_data => true})
  end

  def down
    Spree::TaxRate.drop_translation_table!(:migrate_date => true)
  end
end
