module LGDS::Members::Domain
  class Member
    attr_reader :id, :name

    def initialize(name:, id: nil)
      @id = id
      @name = name
    end

    # @param command [CreateMember]
    # @return [Member]
    def self.create(command)
      new(name: command.name)
    end

    def change_name(name)
      @name = name
    end

    def ==(o)
      o.class == self.class && o.id == self.id && o.name == self.name
    end

    def to_s
      "LGDS::Domain::Member name: #{self.name}, id: #{self.id}"
    end
  end
end
