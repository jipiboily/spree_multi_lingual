Spree::Variant.class_eval do
  alias_method :old_price=, :price=

  def price=(value)
    write_attribute(:price, value.to_s.tr(',', '.').to_f)
  end

  [:cost_price, :weight, :height, :width, :depth].each do |attribute|
    define_method("#{attribute}=") do |value|
      write_attribute(attribute, value.to_s.tr(',', '.').to_f)
    end
  end
end
