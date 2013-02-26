Spree::Core::Engine.routes.draw do
  filter :locale, :exclude => /^\/admin/ if SpreeMultiLingual.use_locale_filter
end
