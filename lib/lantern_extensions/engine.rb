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

      Canvas::PasswordPolicy.define_singleton_method :default_policy do
        if Canvas::Plugin.find(:lantern_extensions).enabled?
          {
            :max_repeats => 2,
            :max_sequence => 3,
            :disallow_common_passwords => true,
            :min_length => 10
          }
        else
          { :min_length => 8 }
        end
      end

      # ApplicationController.prepend_view_path "gems/plugins/lantern_extensions/app/views/lantern_extensions"
      # Mailer.prepend_view_path "gems/plugins/lantern_extensions/app/messages"
      Canvas::MessageHelper.add_message_path(LanternExtensions::NullablePath.new)
    end
  end
end
