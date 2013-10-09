Spree::ShipmentMailer.class_eval do
  helper 'spree/base'

  def shipped_email(shipment, resend=false)
    @shipment = shipment.is_a?(Spree::Shipment) ? shipment : Spree::Shipment.find(shipment)
    I18n.locale = @shipment.order.locale
    subject = (resend ? "[#{Spree.t(:resend).upcase}] " : "")
    subject += "#{Spree::Config[:site_name]} #{Spree.t('shipment_mailer.shipped_email.subject')} ##{@shipment.order.number}"
    mail(:to => @shipment.order.email,
    :subject => subject,
    :from => from_address)
  end
end
