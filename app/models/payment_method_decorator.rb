module Spree
  PaymentMethod.class_eval do
    translates :name, :description
  end
end
