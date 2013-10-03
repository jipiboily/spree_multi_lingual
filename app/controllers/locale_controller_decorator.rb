module Spree
  LocaleController.class_eval do
    def set
      if request.referer && request.referer.starts_with?('http://' + request.host)
        session['user_return_to'] = request.referer
      end

      if params[:locale] && I18n.available_locales.map(&:to_s).include?(params[:locale])
        session[:locale] = I18n.locale = params[:locale]
        flash.notice = Spree.t(:locale_changed)
      else
        flash[:error] = Spree.t(:locale_not_changed)
      end
      redirect_to root_path(:locale => params[:locale])
    end
  end
end