module Nesta
  module Plugin
    module Simplicity
      module Helpers
        # If your plugin needs any helper methods, add them here...
      end
    end
  end

  class App
    helpers Nesta::Plugin::Simplicity::Helpers
  end
end
