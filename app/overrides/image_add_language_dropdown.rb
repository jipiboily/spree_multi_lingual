Deface::Override.new(
  :virtual_path => "spree/admin/images/edit",
  :insert_before   => "[data-hook='edit_image']",
  :text         => '<%= render "spree/admin/shared/language_dropdown", :object => @image -%>',
  :name         => "image_add_language_dropdown"
)

Deface::Override.new(
  :virtual_path => "spree/admin/images/_form",
  :insert_bottom => "[data-hook='alt_text'] td:first",
  :text         => "(m)",
  :name         => "image_alt_text_multi_indicator"
)
