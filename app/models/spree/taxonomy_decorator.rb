module Spree
  Taxonomy.class_eval do
    translates :name

    private
    def set_name
      if self.root
        self.root.update_attributes(attrs_translations_for(:name))
      else
        self.root = Taxon.create!({ :taxonomy_id => self.id, :name => self.name })
      end
    end
  end
end