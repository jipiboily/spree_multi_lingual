module Spree
  Taxonomy.class_eval do
    translates :name
    globalize_accessors locales: SpreeMultiLingual.languages, attribtues: [:name]

    def translations_for(attribute_name)
      {}.tap do |attrs|
        translations.select([attribute_name, :locale]).each do |attribute|
          attr_name = "#{attribute_name}_#{attribute[:locale]}".to_sym
          attrs[attr_name] = attribute[attribute_name]
        end
      end
    end

    private
    def set_name
      if self.root
        self.root.update_attributes(translations_for(:name))
      else
        self.root = Taxon.create!({ :taxonomy_id => self.id, :name => self.name })
      end
    end
  end
end