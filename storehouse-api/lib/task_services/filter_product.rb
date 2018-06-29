module TaskServices
  class FilterProduct

    def initialize(products)
      @products = products
    end

    def apply_by(name)
      @products.each do |obj|
        next unless obj.has_value?(name)
        products_dictionary[name].push(obj)
        remove_category_attr(obj, name)
      end
      products_dictionary
    end

    private
    
    def products_dictionary
      @products_dictionary ||= Hash.new{ |h,k| h[k] = [] }
    end

    def remove_category_attr(obj, name)
      obj.delete(obj.key(name))
    end
  end
end
