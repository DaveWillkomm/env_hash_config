$LOAD_PATH.unshift File.expand_path('../lib', __dir__)

require 'coveralls'
require 'dotenv'

Dotenv.load '.env.test'
Coveralls.wear!

require 'env_hash_config'
