Spree::Product.class_eval do
  translates :name, :description, :meta_description, :meta_keywords, :permalink
  globalize_accessors locales: SpreeMultiLingual.languages, attribtues: [:name, :description, :meta_description ,:meta_keywords, :permalink]
end
