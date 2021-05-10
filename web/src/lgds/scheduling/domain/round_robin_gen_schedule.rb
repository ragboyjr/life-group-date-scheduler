module LGDS::Scheduling::Domain
  # algorithm pulled from stack overflow: https://stackoverflow.com/a/6649732
  class RoundRobinGenSchedule
    # @param members [Array<Member>]
    # @return [GeneratedSchedule]
    def call(members)
      raise 'Cannot generate schedule without any members.' if members.empty?

      if members.size.odd?
        members << nil
      end

      scheduled_sets = (1..(members.size - 1)).map do |index|
        first = members[0]
        rest = members[1..-1].rotate((index - 1) * -1)
        rotated_members = [first, *rest]

        ScheduledSet.new(
          rotated_members[0..((members.size / 2) - 1)]
            .zip(rotated_members[(members.size / 2)..-1].reverse)
            .map do |left, right|
              next ScheduledPair.bye(left) if right == nil
              next ScheduledPair.bye(right) if left == nil
              ScheduledPair.pair(left, right)
            end
        )
      end

      GeneratedSchedule.new(scheduled_sets)
    end
  end
end