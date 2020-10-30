module PasswordEnforcer
  class NullablePath
    def to_str
      base_path = File.join(Rails.root.to_s, 'gems', 'plugins', 'password_enforcer', 'messages')
      if File.exist?(File.join(Rails.root.to_s, 'enable'))
        base_path
      else
        # this is a path that is known to not exist
        File.join(base_path, 'null')
      end
    end
  end
end
