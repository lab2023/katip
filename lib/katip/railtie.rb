require 'katip'
require 'rails'

module Katip
  class Railtie < Rails::Railtie
    railtie_name :katip

    rake_tasks do
      load 'tasks/katip.rake'
    end
  end
end