module RailsHeroicons
  class IconNotFound < Exception
  end

  class Icons
    def icon(name, **args)
      style = args.fetch(:style, "solid")
      file_path = RailsHeroicons.root("lib/rails_heroicons/icons/#{style}/#{name}.svg")

      begin
        file_data = File.read(file_path)
      rescue
        raise RailsHeroicons::IconNotFound
      end

      class_name = args.fetch(:class_name, args.fetch(:class, nil))
      label = args.fetch(:label, name)
      file_data.sub!(/<svg/, "<svg class=\"#{class_name}\" arial-label=\"#{label}\"")

      file_data.html_safe
    end
  end
end
