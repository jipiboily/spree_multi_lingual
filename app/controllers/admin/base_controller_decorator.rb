Spree::Admin::BaseController.class_eval do
  # removed link to /products
  helper_method :locale_suffix

  def locale_suffix(locale)
    locale ||= I18n.locale
    I18n.locale == locale ? "" : "_"+ locale
  end

  private

  def set_user_language
    I18n.locale = Rails.application.config.i18n.default_locale
  end

end
