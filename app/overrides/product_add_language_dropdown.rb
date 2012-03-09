Deface::Override.new(
        :virtual_path  => "spree/admin/products/_form",
        :insert_top => "[data-hook='admin_product_form_left']",
        :text => '<%= render "spree/admin/shared/language_dropdown", :object => @product -%>',
        :name    => "product_add_language_dropdown")