require "vivus/engine"

module Vivus
  class Engine < ::Rails::Engine
    isolate_namespace Vivus
  end
end
