module Spree
  Taxon.class_eval do
    translates :name, :description, :permalink
    after_save :set_permalink_and_save

    before_update :set_permalink

    # Public : Permalink setter with multi language support
    #
    # string - The permalink part of the taxon
    #
    # Set the full permalink accordingly from the argument permalink
    #
    # Returns nothing
    (SpreeMultiLingual.languages + [""]).each do |locale|
      locale_suffix = locale.empty? ? "" : "_#{locale}"
      define_method("permalink#{locale_suffix}=") do |permalink_part|
        opts = locale.empty? ? {} : { :locale => locale.to_sym }
        write_attribute(:permalink, (ancestors_permalink(opts) << permalink_part).join('/'), opts)
      end
    end

    def ancestors_permalink(opts = {})
      ancestors.map { |a| a.permalink_name(opts) }
    end

    def permalink_prefix
      ancestors_permalink.join('/')
    end

    # Returns last part of permalink
    #
    # Example :
    # taxon.permalink
    # => 'ruby-on-rails-fr/sinatra-fr'
    # taxon.permalink_name
    # => 'sinatra-fr'
    def permalink_name(opts = {})
      read_attribute(:permalink, opts).split('/').last
    end

    def default_permalink_name
      permalink.blank? ? name.to_url : permalink_name
    end

    def localed_permalink
      [].tap do |res|
        SpreeMultiLingual.languages.each do |lang|
          res << {:permalink => permalink_name(:locale => lang), :locale => lang}
        end
      end
    end

    def set_permalink
      self.permalink = default_permalink_name
      localed_permalink.each do |t|
        self.send("permalink_#{t[:locale]}=", t[:permalink])
      end
      children.reload.each { |c| c.save }
      true
    end

    # awesome_set hack to run this callback only on create, could not access ancestors with after_create
    # https://github.com/collectiveidea/awesome_nested_set/issues/29
    def set_permalink_and_save
      return true if @permalinK_done
      set_permalink
      @permalinK_done = true
      save!
    end

  end
end