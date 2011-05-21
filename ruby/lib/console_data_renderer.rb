class ConsoleDataRenderer
  def initialize(data_source)
    @data_source = data_source
  end
  
  def render
    data = @data_source.all_rows
    puts data.inspect
  end
end