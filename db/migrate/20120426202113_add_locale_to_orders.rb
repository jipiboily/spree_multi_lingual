class AddLocaleToOrders < ActiveRecord::Migration
  def change
    add_column  :spree_orders,  :locale,  :string
  end
end
