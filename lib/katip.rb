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

end
