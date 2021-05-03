module LGDS::Domain
  class ScheduledPair
    private_class_method :new

    # @param left [Member]
    # @param right [Member, nil]
    def initialize(left, right)
      @left = left
      @right = right
    end

    # @param left [Member]
    # @param right [Member]
    def self.pair(left, right)
      new(
        left.name < right.name ? left : right,
        left.name < right.name ? right : left,
      )
    end

    # @param [Member]
    def self.bye(member)
      new(member, nil)
    end

    def ==(o)
      o.class == self.class && o.unpack == self.unpack
    end

    def unpack
      [@left, @right]
    end
  end
end

