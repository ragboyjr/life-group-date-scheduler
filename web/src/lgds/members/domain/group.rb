module LGDS::Members::Domain
  class Group
    attr_reader :name, :members

    # @param name [String]
    def initialize(name:, members: [])
      @name = name
      @members = members
    end

    # @param member [Member]
    def add_member(member)
      @members << member
    end

    def create_schedule

    end
  end
end