# could not decorate Spree::Core::ControllerHelpers::Common#set_user_locale
# so manualy override this method here by including ControllerHelperLocale

Spree::StoreController.class_eval do
  include SpreeMultiLingual::ControllerHelperLocale
end

# spree_devise_auth_devise controllers
%w{Spree::UserRegistrationsController Spree::UserPasswordsController Spree::UserSessionsController Spree::UsersController}.each do |klass|
  klass.class_eval do
    include SpreeMultiLingual::ControllerHelperLocale
  end if klass = klass.safe_constantize
end