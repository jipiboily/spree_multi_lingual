Spree::OrderMailer.class_eval do
  # There might be a cleaner way to set locale instead of rewriting each method
  def confirm_email(order, resend=false)
    @order = find_order(order)
    I18n.locale = @order.locale
    subject = (resend ? "[#{t(:resend).upcase}] " : "")
    subject += "#{Spree::Config[:site_name]} #{t('order_mailer.confirm_email.subject')} ##{@order.number}"
    mail(:to => @order.email, :from => from_address, :subject => subject)
  end

  def cancel_email(order, resend=false)
    @order = find_order(order)
    I18n.locale = @order.locale
    subject = (resend ? "[#{t(:resend).upcase}] " : "")
    subject += "#{Spree::Config[:site_name]} #{t('order_mailer.cancel_email.subject')} ##{@order.number}"
    mail(:to => @order.email, :from => from_address, :subject => subject)
  end
end