Spree::Core::Search::Base.class_eval do
  def get_products_conditions_for(base_scope, query)
    conditions = []
    query.split.each do |keyword|
      conditions << [:name, :description].map do |field|
        "spree_product_translations.#{field} LIKE '%#{keyword}%'"
      end
    end
    base_scope.where(conditions.join(' OR '))
  end

  protected

    def get_base_scope_with_multi_lingual
      base_scope = Spree::Product.active.joins(:translations).where("locale = ?", I18n.locale)
      base_scope.merge(get_base_scope_without_multi_lingual)
    end

    alias_method_chain :get_base_scope, :multi_lingual

end