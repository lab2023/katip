require 'katip/version'
require 'katip/change_logger'

module Katip
  if File.exists?('bin/rails')
    begin
      require 'katip/railtie'
    rescue LoadError
    end
  end
end
