class AddDescriptionToShippingMethod < ActiveRecord::Migration
  def up
    change_table :spree_shipping_methods do |t|
       t.text :description
    end
    Spree::ShippingMethod.reset_column_information

    change_table :spree_shipping_method_translations do |t|
      t.text :description
    end
  end

  def down
    change_table :spree_shipping_method_translations do |t|
      t.text :description
    end
    change_table :spree_shipping_methods do |t|
       t.remove :description
    end
  end
end
