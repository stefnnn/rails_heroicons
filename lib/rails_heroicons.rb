require "rails_heroicons/icons"
require "rails_heroicons/railtie"

module RailsHeroicons
  def self.root(path = nil)
    if path
      File.join(File.dirname(__dir__), path)
    else
      File.dirname(__dir__)
    end
  end

  module ViewHelpers
    def heroicon(name, **args)
      RailsHeroicons::Icons.new.icon(name, **args)
    end
  end
end
