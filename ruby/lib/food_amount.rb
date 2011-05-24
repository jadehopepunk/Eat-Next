class FoodAmount
  attr_reader :package_size, :package_size_units
  
  def initialize(number_of_packages, package_size, package_size_units)
    @number_of_packages = number_of_packages
    @package_size = package_size
    @package_size_units = package_size_units
  end
  
  def to_s
    number_of_packages > 1 ? "#{number_of_packages} x #{package_string}" : package_string
  end
  
  def /(denominator)
    raise ArgumentError unless number_of_packages
    raise ArgumentError unless number_of_packages > 0
    raise ArgumentError unless denominator
    raise ArgumentError unless denominator > 0
    raise ArgumentError unless number_of_packages % denominator == 0
    FoodAmount.new(number_of_packages / denominator, package_size, package_size_units)
  end
  
  def number_of_packages
    @number_of_packages || 1
  end

  private
  
    def package_string
      package_size_string + @package_size_units.to_s
    end
    
    def package_size_string
      (@package_size % 1 == 0 ? @package_size.to_i : @package_size).to_s
    end
end