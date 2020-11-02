module PasswordEnforcer
  class Engine < ::Rails::Engine
    isolate_namespace PasswordEnforcer

    config.to_prepare do
      Canvas::Plugin.register(:password_enforcer, nil, {
        name: "Password Enforcer",
        author: "Atomic Jolt",
        description: "Enables stronger default password settings",
        version: "0.1.0",
        select_text: "Password Enforcer 0.1.0",
        settings_partial: 'password_enforcer/plugin_settings'
      })

      Canvas::PasswordPolicy.define_singleton_method :default_policy do
        if Canvas::Plugin.find(:password_enforcer).enabled?
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

      # ApplicationController.prepend_view_path "gems/plugins/password_enforcer/app/views/password_enforcer"
      # Mailer.prepend_view_path "gems/plugins/password_enforcer/app/messages"
      Canvas::MessageHelper.add_message_path(PasswordEnforcer::NullablePath.new)
    end
  end
end
