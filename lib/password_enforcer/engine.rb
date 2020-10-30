module PasswordEnforcer
  class Engine < ::Rails::Engine
    isolate_namespace PasswordEnforcer

    config.to_prepare do
      Canvas::PasswordPolicy.define_singleton_method :default_policy do
        {
          :max_repeats => 2,
          :max_sequence => 3,
          :disallow_common_passwords => true,
          :min_length => 10
        }
      end

      # ApplicationController.prepend_view_path "gems/plugins/password_enforcer/app/views/password_enforcer"
      # Mailer.prepend_view_path "gems/plugins/password_enforcer/app/messages"
      Canvas::MessageHelper.add_message_path(PasswordEnforcer::NullablePath.new)
    end
  end
end
