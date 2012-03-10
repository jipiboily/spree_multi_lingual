Spree::Core::Engine.routes.draw do
  # Add your extension routes here
  filter :locale, :exclude => /^\/admin/
end
