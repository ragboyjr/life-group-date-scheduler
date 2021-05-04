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
      raise 'Pair must not contain duplicates.' if left == right
      new(
        left.name < right.name ? left : right,
        left.name < right.name ? right : left,
      )
    end

    def hash
      unpack.compact.map(&:name).hash
    end

    def eql?(other)
      self == other
    end

    # A bye is a term used in scheduling/tournaments when an individual gets a pass
    # instead of actually being paired up.
    #
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

    def to_s
      unpack.compact.map(&:name).to_s
    end
  end
end