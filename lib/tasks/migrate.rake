namespace :spree_multi_lingual do
  namespace :migrations do

    desc "Migrate data inserted in the system before the extension was added."
    task :migrate_data => :environment do |t, args|

      def move_data_to_translation_table(model)
        model.find_each do |record|
          untranslated_attributes = record.untranslated_attributes
          translation = record.translations.build(:locale => I18n.default_locale)
          model.translated_attribute_names.each do |attribute|
            translation[attribute] = untranslated_attributes[attribute.to_s]
          end
          translation.save!
        end
      end

      move_data_to_translation_table(Spree::Product)
      move_data_to_translation_table(Spree::Taxonomy)
      move_data_to_translation_table(Spree::Taxon)
      move_data_to_translation_table(Spree::OptionType)
      move_data_to_translation_table(Spree::OptionValue)
      move_data_to_translation_table(Spree::ProductProperty)
      move_data_to_translation_table(Spree::TaxCategory)
      move_data_to_translation_table(Spree::Image)
      move_data_to_translation_table(Spree::ShippingMethod)
      move_data_to_translation_table(Spree::Property)

    end

  end
end