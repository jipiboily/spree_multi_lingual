module TranslatesWithAccessors
  def self.included(base)
    base.extend ClassMethods
    base.send(:include, InstanceMethods)
  end

  module InstanceMethods
    def attrs_translations_for(attribute_name)
      {}.tap do |attrs|
        translations.select([attribute_name, :locale]).each do |attribute|
          attr_name = "#{attribute_name}_#{attribute[:locale]}".to_sym
          attrs[attr_name] = attribute[attribute_name]
        end
      end
    end

    def translations_for(attribute_name)
      [].tap do |attrs|
        translations.select([attribute_name, :locale]).each do |attribute|
          attr_name = "#{attribute_name}".to_sym
          attrs << { attr_name => attribute[attribute_name], :locale => attribute[:locale].to_sym }
        end
      end
    end

  end

  module ClassMethods
    def translates(*params)
      options = params.extract_options!
      options.reverse_merge!(:globalize_accessors => true)
      accessors = options.delete(:globalize_accessors)
      super

      params_with_locale = SpreeMultiLingual.languages.map do |locale|
        params.map { |param| "#{param}_#{locale}".to_sym }
      end

      attr_accessible *(params_with_locale + params).flatten

      globalize_accessors locales: SpreeMultiLingual.languages, attributes: params.to_a if accessors
    end
  end
end

ActiveRecord::Base.send :include, TranslatesWithAccessors