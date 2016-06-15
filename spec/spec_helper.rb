$LOAD_PATH.unshift File.expand_path('../lib', __dir__)

require 'dotenv'
require 'env_hash_config'

Dotenv.load '.env.test'
