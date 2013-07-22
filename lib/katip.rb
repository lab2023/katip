require 'katip/version'

module Katip
  require 'katip/railtie' if defined?(Rails)

  @@katip = `katip`

  def self.set(param)
    @@katip = param
  end

  def self.get
    @@katip
  end

  def self.get_file(file_name)
    @@katip = "katip #{file_name}"
  end

end
