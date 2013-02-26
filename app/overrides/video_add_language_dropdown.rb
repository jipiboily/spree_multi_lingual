Deface::Override.new(
:virtual_path => "spree/admin/videos/_form",
:insert_top   => "div.field",
:text         => '<%= render "spree/admin/shared/language_dropdown", :object => @video -%>',
:name         => "video_add_language_dropdown"
)
