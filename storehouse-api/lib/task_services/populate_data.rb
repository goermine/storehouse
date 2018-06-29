module TaskServices
  class PopulateData

    def initialize(data)
      content = CategoryProductsComposer.new(data)
      @products = content.formed_products
    end

    def write_in!
      @products.each do |key, value|
        category = Category.new(name: key)
        category.products.build(value)
        category.save!
      end
    end

    private

    attr_reader :products
  end
end
