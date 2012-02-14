Deface::Override.new(
        :virtual_path  => "spree/admin/products/_form",
        :insert_top => "[data-hook='admin_product_form_left']",
        :partial => "spree/admin/spree_multi_lingual/products/language_dropdown",
        :name    => "product_add_language_dropdown")