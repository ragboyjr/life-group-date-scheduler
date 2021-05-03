module LGDS::Domain
  class ScheduledSet
    # @return [Array<ScheduledPair>]
    attr_reader :scheduled_pairs

    # @param scheduled_pairs [Array<ScheduledPair>]
    def initialize(scheduled_pairs)
      @scheduled_pairs = scheduled_pairs
    end
  end
end

