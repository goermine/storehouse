module TaskServices
  class CategoryProductsComposer
    CATEGORIES = 'categories'.freeze
    PRODUCTS = 'products'.freeze

    def initialize(data)
      @data = data
    end

    def formed_products
       @formed_products ||= filtered_product_by_category
    end

    private

    attr_reader :data

    def product_filter
      @filter_product ||= TaskServices::FilterProduct.new(data[PRODUCTS])
    end

    def filtered_product_by_category
      data[CATEGORIES].reduce({}) do |collector,  name|
        collector = product_filter.apply_by(name).clone
      end
    end
  end
end
