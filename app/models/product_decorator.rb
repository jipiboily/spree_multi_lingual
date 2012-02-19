Spree::Product.class_eval do
  translates :name, :description, :meta_description, :meta_keywords
  globalize_accessors locales: SpreeMultiLingual.languages, attribtues: [:name, :description, :meta_description ,:meta_keywords]
end
