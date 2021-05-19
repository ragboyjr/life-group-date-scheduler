require 'dry-struct'

module LGDS::Members::Domain
  # @!method name
  #   @return [String]
  class AddMemberToGroup < Dry::Struct
    attribute :group_id, LGDS::Types::Strict::Integer
    attribute :member_id, LGDS::Types::Strict::Integer
  end
end