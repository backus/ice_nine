# encoding: utf-8

require 'ice_nine/freezer'
require 'ice_nine/freezer/array'
require 'ice_nine/freezer/hash'
require 'ice_nine/freezer/no_freeze'
require 'ice_nine/freezer/range'

require 'ice_nine/version'

# Base IceNine module
module IceNine

  # Deep Freeze an object
  #
  # @example
  #   object = IceNine.deep_freeze(object)
  #
  # @param [Object] object
  #
  # @return [Object]
  #
  # @api public
  def self.deep_freeze(object)
    case object
    when Numeric
      return object  # do nothing
    when Struct
      object.each(&:freeze)
    end
    Freezer[object.class].deep_freeze(object)
  end

end # module IceNine
