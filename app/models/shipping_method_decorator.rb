module Spree
  ShippingMethod.class_eval do
    translates :name, :description
  end
end
