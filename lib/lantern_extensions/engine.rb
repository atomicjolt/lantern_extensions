module LanternExtensions
  class Engine < ::Rails::Engine
    isolate_namespace LanternExtensions

    config.to_prepare do
      Canvas::Plugin.register(:lantern_extensions, nil, {
        name: "Lantern LMS extensions",
        author: "Atomic Jolt",
        description: "Enables stronger password settings and modifies email templates",
        version: "0.1.0",
        select_text: "Lantern LMS Extensions 0.1.0",
        settings_partial: 'lantern_extensions/plugin_settings'
      })

      if ActiveRecord::Base.connection.table_exists?('plugin_settings') && Canvas::Plugin.find(:lantern_extensions).enabled?
        Canvas::PasswordPolicy.define_singleton_method :default_policy do
          {
            :max_repeats => 2,
            :max_sequence => 3,
            :disallow_common_passwords => true,
            :min_length => 10
          }
        end

        message_path = File.join(Rails.root.to_s, 'gems', 'plugins', 'lantern_extensions', 'messages')
        Canvas::MessageHelper.add_message_path(message_path)
      end
    end
  end
end
