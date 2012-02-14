Spree::Product.class_eval do
  translates :name, :description
  globalize_accessors SpreeMultiLingual.languages
end
