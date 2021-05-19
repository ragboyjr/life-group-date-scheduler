require 'dry-struct'

module LGDS::Members::Domain
  # @!method name
  #   @return [String]
  class CreateGroup < Dry::Struct
    attribute :name, LGDS::Types::Strict::String
  end
end

