module LGDS::Domain
  class ScheduledSet
    # @return [Array<ScheduledPair>]
    attr_reader :scheduled_pairs
    delegate :size, to: :scheduled_pairs

    # @param scheduled_pairs [Array<ScheduledPair>]
    def initialize(scheduled_pairs)
      all_members = scheduled_pairs.flat_map(&:unpack).compact.map(&:name)
      raise 'Members within set must be unique.' if all_members.uniq.size != all_members.size
      @scheduled_pairs = scheduled_pairs
    end
  end
end
