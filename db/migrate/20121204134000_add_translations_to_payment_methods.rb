# class AddTranslationsToPaymentMethods < ActiveRecord::Migration
#   def up
#     Spree::PaymentMethod.create_translation_table!(:name => :string, :description => :text)
#   end
# 
#   def down
#     Spree::PaymentMethod.drop_translation_table!
#   end
# end
