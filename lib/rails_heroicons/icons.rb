module RailsHeroicons
  class IconNotFound < Exception
  end

  class Icons
    def icon(name, style, class_name)
      file_path = RailsHeroicons.root("lib/rails_heroicons/icons/#{style}/#{name}.svg")

      begin
        file_data = File.read(file_path)
      rescue
        raise RailsHeroicons::IconNotFound
      end

      if class_name.present?
        file_data.sub!(/<svg/, "<svg class=\"#{class_name}\" alt=\"#{name}\"")
      end

      file_data.html_safe
    end
  end
end