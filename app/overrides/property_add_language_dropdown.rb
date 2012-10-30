Deface::Override.new(
  :virtual_path => "spree/admin/properties/edit",
  :insert_before=> "code[erb-loud]:contains(\"render :partial => 'form'\")",
  :text         => '<%= render "spree/admin/shared/language_dropdown", :object => @property -%>',
  :name         => "property_add_language_dropdown"
)

