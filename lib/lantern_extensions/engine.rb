module LanternExtensions
  class Engine < ::Rails::Engine
    isolate_namespace LanternExtensions

    config.to_prepare do
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
