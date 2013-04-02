Deface::Override.new(
  :virtual_path => "spree/admin/tax_categories/edit",
#  :insert_before   => "[data-hook='admin_tax_category_form_fields']",
  :insert_after  => "code[erb-loud]:contains('form_for')",
  :text         => '<%= render "spree/admin/shared/language_dropdown", :object => @tax_category -%>',
  :name         => "tax_category_add_language_dropdown"
)
