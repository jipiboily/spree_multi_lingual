Spree::Core::Search::Base.class_eval do
  def get_products_conditions_for(base_scope, query)
    if query.blank?
      base_scope
    else
      conditions = []
      keywords = []
      query.split.each do |keyword|
        [:name, :description].map do |field|
          conditions << "`#{Spree::Product.translations_table_name}`.#{field} LIKE ?"
          keywords << "%#{keyword}%"
        end
      end
      base_scope.where(conditions.join(' OR '), *keywords)
    end
  end

  protected

    def get_base_scope_with_multi_lingual
      base_scope = Spree::Product.active.joins(:translations).where("locale = ?", I18n.locale)
      base_scope.merge(get_base_scope_without_multi_lingual)
    end

    alias_method_chain :get_base_scope, :multi_lingual

end