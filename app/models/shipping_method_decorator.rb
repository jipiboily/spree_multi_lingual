module Spree
  ShippingMethod.class_eval do
    translates :name
  end
end
