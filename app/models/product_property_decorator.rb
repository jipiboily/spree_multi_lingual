module Spree
  ProductProperty.class_eval do
    translates :value
  end
end