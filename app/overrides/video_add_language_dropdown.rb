Deface::Override.new(
  :virtual_path => "spree/admin/promotions/_form",
  :insert_top   => "#general_fields",
  :text         => '<%= render "spree/admin/shared/language_dropdown", :object => @promotion -%>',
  :name         => "promotion_add_language_dropdown"
)
