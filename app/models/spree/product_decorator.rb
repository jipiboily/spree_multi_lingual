Spree::Product.class_eval do
  translates :name, :description, :meta_description, :meta_keywords, :permalink

  # for adding products which are closely related to existing ones
  # define "duplicate_extra" for site-specific actions, eg for additional fields
  def duplicate
    p = self.dup

    (SpreeMultiLingual.languages).each do |locale|
      locale_suffix = locale.empty? ? "" : "_#{locale}"

      name_locale = (I18n.t :copy_of, :locale => locale) + read_attribute(:name, :locale => locale)
      description_locale = read_attribute(:description, :locale => locale)
      meta_description_locale = read_attribute(:meta_description, :locale => locale)
      meta_keywords_locale = read_attribute(:meta_keywords, :locale => locale)
      permalink_locale = (I18n.t :copy_of_permalink, :locale => locale) + read_attribute(:permalink, :locale => locale)

      eval("p.name"+locale_suffix+" = name_locale")
      eval("p.description"+locale_suffix+" = description_locale")
      eval("p.meta_description"+locale_suffix+" = meta_description_locale")
      eval("p.meta_keywords"+locale_suffix+" = meta_keywords_locale")
      eval("p.permalink"+locale_suffix+" = permalink_locale")
    end

    p.deleted_at = nil
    p.created_at = p.updated_at = nil
    p.taxons = taxons

    p.product_properties = product_properties.map { |q| r = q.dup; r.created_at = r.updated_at = nil; r }

    image_dup = lambda { |i| j = i.dup; j.attachment = i.attachment.clone; j }

    variant = master.dup
    variant.sku = 'COPY OF ' + master.sku
    variant.deleted_at = nil
    variant.images = master.images.map { |i| image_dup.call i }
    p.master = variant

    # don't dup the actual variants, just the characterising types
    p.option_types = option_types if has_variants?

    # allow site to do some customization
    p.send(:duplicate_extra, self) if p.respond_to?(:duplicate_extra)
    p.save!
    p
  end
end

