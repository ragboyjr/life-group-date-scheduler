require 'dry-struct'

module LGDS::Members::Domain
  # @!method name
  #   @return [String]
  class CreateMember < Dry::Struct
    attribute :name, LGDS::Types::Strict::String
  end
end

