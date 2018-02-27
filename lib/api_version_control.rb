class ApiVersionControl
  def initialize(options)
    @version = options[:version]
    @default = options[:default]
  end
  
  def matches?(request)
    @default || request.headers['Accept'].include?("application/vnd.eagro.v#{@version}")
  end
end