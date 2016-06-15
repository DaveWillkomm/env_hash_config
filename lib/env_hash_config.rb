require 'env_hash_config/version'
require 'ostruct'

module EnvHashConfig
  def self.create(options: ENV, array_options: [], default_options: {}, integer_options: [])
    options = options.inject({}) { |h,(k,v)| h.tap { |h| h[k.downcase.to_sym] = v } }
    options = array_options.inject(options) { |h,k| h.tap { |h| h[k] = h[k].split ',' if h[k] } }
    options = integer_options.inject(options) { |h,k| h.tap { |h| h[k] = h[k].to_i if h[k] } }
    options = default_options.merge options
    options = yield options if block_given?

    OpenStruct.new options
  end
end
