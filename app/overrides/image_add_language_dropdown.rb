Deface::Override.new(
  :virtual_path => "spree/admin/images/edit",
  :insert_before   => "[data-hook='edit_image']",
  :text         => '<%= render "spree/admin/shared/language_dropdown", :object => @image -%>',
  :name         => "image_add_language_dropdown"
)

