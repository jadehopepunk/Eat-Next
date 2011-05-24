class FoodAmount
  def initialize(number_of_packages, package_size, package_size_units)
    @number_of_packages = number_of_packages
    @package_size = package_size
    @package_size_units = package_size_units
  end
  
  def to_s
    number_of_packages > 1 ? "#{number_of_packages} x #{package_string}" : package_string
  end
  
  private
  
    def number_of_packages
      @number_of_packages || 1
    end
  
    def package_string
      package_size_string + @package_size_units.to_s
    end
    
    def package_size_string
      (@package_size % 1 == 0 ? @package_size.to_i : @package_size).to_s
    end
end