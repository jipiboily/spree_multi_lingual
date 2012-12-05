Deface::Override.new(
  :virtual_path => "spree/admin/shipping_methods/edit",
  :insert_after => "[data-hook='admin_shipping_method_edit_form_header']",
  :text         => '<%= render "spree/admin/shared/language_dropdown", :object => @shipping_method -%>',
  :name         => "shipping_methods_add_language_dropdown"
)
