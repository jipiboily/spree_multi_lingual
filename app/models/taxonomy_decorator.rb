Spree::Taxonomy.class_eval do
  translates :name
  globalize_accessors locales: SpreeMultiLingual.languages, attribtues: [:name]
end
