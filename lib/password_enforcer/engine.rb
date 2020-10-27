module PasswordEnforcer
  class Engine < ::Rails::Engine
    config.to_prepare do
      Canvas::PasswordPolicy.define_singleton_method :default_policy do
       {
         # :max_repeats => 2,
         # :max_sequence => 3,
         # :disallow_common_passwords => true,
         :min_length => 10
       }
      end
    end
  end
end
