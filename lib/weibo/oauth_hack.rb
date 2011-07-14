# This hack is used for Weibo upload

unless {}.respond_to?(:stringify_keys)
  class Hash
     def stringify_keys
       inject({}) do |options, (key, value)|
         options[key.to_s] = value
         options
       end
     end
  end
end

module PostBodyHack
  @@parameters = nil
  def self.parameters=(val)
    @@parameters = val
  end

  def self.parameters
    @@parameters
  end

  def self.apply_hack(params={}, &block)
    self.parameters = params.stringify_keys
    rv = yield
    self.parameters = {}
    rv
  end
end

class OAuth::RequestProxy::Base
  def parameters_for_signature
    params_for_signature = parameters.reject { |k,v| k == "oauth_signature" ||unsigned_parameters.include?(k) }
    params_for_signature.merge!(PostBodyHack.parameters || {}) if defined? PostBodyHack
    # params_for_signature
  end
end