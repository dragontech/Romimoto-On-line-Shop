ProductsController.class_eval do

  def load_data
    load_object

    @variants = Variant.active.find_all_by_product_id(@product.id, :include => [:option_values, :images])
    @product_properties = ProductProperty.find_all_by_product_id(@product.id, :include => [:property])
    @selected_variant = @variants.detect { |v| v.available? }
    @taxon = @product.taxons.first(:conditions => "permalink LIKE '%categories%'")
  end
end
