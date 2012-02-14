module ActiveRecord
  module GlobalizeAccessors
    def self.included(base)
      base.extend ActMethods
    end
    
    module ActMethods
      def globalize_accessors(languages)
        attribs = translated_attribute_names
        attribs.each do |attr_name|
          languages.each do |with_locale|
            define_method :"#{attr_name}_#{with_locale}" do
              globalize.fetch with_locale, attr_name
            end

            define_method :"#{attr_name}_#{with_locale}=" do |val|
              globalize.stash.write with_locale, attr_name, val
            end
          end
        end
        
        @easy_accessors ||= []
        languages.each do |with_locale|
          @easy_accessors << with_locale
        end
         
      end
      
      def easy_accessors
        @easy_accessors && @easy_accessors.uniq
      end
    end
  end
end
