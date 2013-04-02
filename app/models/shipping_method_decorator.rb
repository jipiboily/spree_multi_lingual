module Spree
  ShippingMethod.class_eval do
    translates :name, :description

    attr_accessible :description

  end
end
