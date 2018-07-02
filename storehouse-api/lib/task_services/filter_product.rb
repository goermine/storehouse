module TaskServices
  class FilterProduct
    CATEGORY = 'category'.freeze

    def initialize(products)
      @products = products
    end

    def apply_by(name)
      @products.each do |obj|
        next unless obj[CATEGORY]&.match(/#{name}/i)
        products_dictionary[name].push(obj)
        remove_category_attr(obj)
      end
      products_dictionary
    end

    private

    def products_dictionary
      @products_dictionary ||= Hash.new{ |h,k| h[k] = [] }
    end

    def remove_category_attr(obj)
      obj.delete(CATEGORY)
    end
  end
end
