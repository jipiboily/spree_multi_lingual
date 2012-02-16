Spree::Product.class_eval do
  translates :name, :description
  globalize_accessors locales: SpreeMultiLingual.languages, attribtues: [:name, :description]
end
