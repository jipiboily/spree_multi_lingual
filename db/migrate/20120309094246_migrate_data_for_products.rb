class MigrateDataForProducts < ActiveRecord::Migration
  def up
    Spree::Product.transaction do
      Spree::Product.find_each do |product|
        product.update_attributes! product.untranslated_attributes
      end
    end
  end

  def down
  end
end
