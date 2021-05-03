module LGDS::Domain
  class RoundRobinGenSchedule
    # @param members [Array<Member>]
    # @return Array<ScheduledSet>
    def call(members)
      return [ScheduledSet.new([ScheduledPair.bye(members[0])])] if members.size == 1
      []
    end
  end
end