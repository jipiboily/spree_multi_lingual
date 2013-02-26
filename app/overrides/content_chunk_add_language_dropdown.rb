Deface::Override.new(
  :virtual_path => "spree/admin/content_chunks/_form",
  :insert_before   => "[data-hook='admin_content_chunk_form']",
  :text         => '<%= render "spree/admin/shared/language_dropdown", :object => @content_chunk -%>',
  :name         => "content_chunk_add_language_dropdown"
)
