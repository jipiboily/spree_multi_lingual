Spree::Core::Engine.routes.draw do
  filter :locale, :exclude => /^\/admin/
end
