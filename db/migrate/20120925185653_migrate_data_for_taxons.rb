class MigrateDataForTaxons < ActiveRecord::Migration
  def up
    Spree::Taxon.transaction do
      Spree::Taxon.find_each do |taxon|
        taxon.update_attributes!(taxon.untranslated_attributes, :without_protection => false)
      end
    end
  end

  def down
  end
end
