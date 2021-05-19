module LGDS::Members::Domain
  class Group
    attr_reader :id, :name, :members

    # @param name [String]
    def initialize(name:, members: [], id: nil)
      @name = name
      @members = members
      @id = id
    end

    # @param command [CreateGroup]
    def self.create(command)
      new(name: command.name)
    end

    # @param member [Member]
    def add_member(member)
      @members << member
    end

    def create_schedule

    end
  end
end