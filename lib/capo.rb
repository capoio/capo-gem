# $LOAD_PATH << File.dirname(__FILE__)

require 'capo/version'

require 'capo/init'
require 'capo/recipes'

module Capo
  class << self
    def repository_path
      File.expand_path '~/.capo'
    end
  end
end
