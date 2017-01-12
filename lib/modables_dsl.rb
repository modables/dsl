$:.unshift File.join File.dirname(__FILE__), 'modables_dsl'

require 'active_support/json'
require 'active_support/core_ext/hash/deep_merge'
require 'optparse'
require 'ostruct'

require 'modables_dsl/cli'
require 'modables_dsl/dsl/arguments'
require 'modables_dsl/dsl/core'
