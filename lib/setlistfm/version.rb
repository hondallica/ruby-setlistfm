module Version
  def version
    '0.1.0'.freeze
  end

  def api_version(api_version = '1.0')
    api_version
  end

  module_function :version, :api_version
end
