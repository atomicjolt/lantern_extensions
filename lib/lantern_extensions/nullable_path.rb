module LanternExtensions
  class NullablePath
    def to_str
      base_path = File.join(Rails.root.to_s, 'gems', 'plugins', 'lantern_extensions', 'messages')
      if Canvas::Plugin.find(:lantern_extensions).enabled?
        base_path
      else
        # this is a path that is known to not exist
        File.join(base_path, 'null')
      end
    end
  end
end
