Spree::Taxon.class_eval do
  translates :name, :description, :permalink
  globalize_accessors locales: SpreeMultiLingual.languages, attribtues: [:name, :description, :permalink]
end
