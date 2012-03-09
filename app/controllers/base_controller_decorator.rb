Spree::Admin::BaseController.class_eval do
  # removed link to /products
  helper_method :locale_suffix

  def locale_suffix(locale)
    I18n.locale == locale.to_sym ? "".to_sym : "_"+ locale
  end
end