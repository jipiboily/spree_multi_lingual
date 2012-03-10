module TranslatesWithAccessors
  def self.included(base)
    base.extend ClassMethods
    base.send(:include, InstanceMethods)
  end

  module InstanceMethods
    def translations_for(attribute_name)
      {}.tap do |attrs|
        translations.select([attribute_name, :locale]).each do |attribute|
          attr_name = "#{attribute_name}_#{attribute[:locale]}".to_sym
          attrs[attr_name] = attribute[attribute_name]
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

      globalize_accessors locales: SpreeMultiLingual.languages, attributes: params.to_a if accessors
    end
  end
end

ActiveRecord::Base.send :include, TranslatesWithAccessors