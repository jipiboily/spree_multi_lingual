Deface::Override.new(
  :virtual_path => "spree/admin/shipping_methods/edit",
  :insert_before   => "code[erb-loud]:contains(\"render :partial => 'form'\")",
  :text         => '<%= render "spree/admin/shared/language_dropdown", :object => @shipping_method -%>',
  :name         => "shipping_method_add_language_dropdown",
  :original => '8a9ce4cf5ad1cd0f240dcf314f1ffd8bb51bbc91'
)

Deface::Override.new(
  :virtual_path => "spree/admin/shipping_methods/_form",
  :insert_before => "code[erb-loud]:contains('f.field_container :zone_id do')",
  :text         => "<%= f.field_container :description do %> \
                       <%= f.label :description, t(:description) %> <br /> \
                       <%= f.text_area :description, {:cols => 60, :rows=>2, :class=>'fullwidth', :style=>'height:auto'} %> \
                       <%= f.error_message_on :description %> \
                    <% end %>",
  :name         => "shipping_method_description_multi_indicator"
)
