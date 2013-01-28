class AddTranslationsToPromotions < ActiveRecord::Migration
  def up
    Spree::Promotion.create_translation_table!(:description => :string, :name => :string)
  end

  def down
    Spree::Promotion.drop_translation_table!
  end
end
