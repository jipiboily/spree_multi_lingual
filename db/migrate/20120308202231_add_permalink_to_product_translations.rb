class AddPermalinkToProductTranslations < ActiveRecord::Migration
  def change
    add_column  :spree_product_translations, :permalink, :string
  end
end
