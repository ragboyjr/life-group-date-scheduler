module LGDS::Domain
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

      return GeneratedSchedule.new(scheduled_sets)

      # p scheduled_sets
      #
      # size_of_set = (members.size / 2).ceil
      # unique_pairs = members_to_unique_permuted_pairs(members)
      # scheduled_sets = unique_pairs_to_scheduled_sets(unique_pairs, size_of_set)
      #
      # p scheduled_sets
      #
      #
      # return GeneratedSchedule.new([ScheduledSet.new(members_to_pairs(members))]) if members.size <= 2
      #
      # raise 'Cannot generate schedule.'
    end

    private

    # @param members [Array<Member>]
    # @return [Array<ScheduledPair>]
    def members_to_pairs(members)
      members.each_slice(2).map do |pair|
        next ScheduledPair.bye(*pair) if pair.size == 1
        ScheduledPair.pair(*pair)
      end
    end

    # @param members [Array<Member>]
    # @return [Array<ScheduledPair>]
    def members_to_unique_permuted_pairs(members)
      members.permutation(2).map do |pair|
        ScheduledPair.pair(*pair)
      end.uniq
    end

    # @param pairs [Array<ScheduledPair>]
    # @param size_of_set [Integer]
    # @return [Array<ScheduledSet>]
    def unique_pairs_to_scheduled_sets(pairs, size_of_set)
      scheduled_sets = []
      remaining_available_pairs = pairs
      current_scheduled_set = []

      until remaining_available_pairs.empty?
        pair_to_add = remaining_available_pairs.find do |pair|
          can_add_pair_to_set?(current_scheduled_set, pair)
        end
        p pair_to_add
        raise 'No pair found to add for schedule set' unless pair_to_add

        current_scheduled_set << pair_to_add
        remaining_available_pairs = remaining_available_pairs.filter do |pair|
          pair != pair_to_add
        end

        if current_scheduled_set.size == size_of_set
          scheduled_sets << ScheduledSet.new(current_scheduled_set)
          current_scheduled_set = []
        end
      end

      scheduled_sets
    end

    # depth first search algorithm to build the next scheduled set
    # We need to perform a DFS algorithm
    #
    def build_next_available_scheduled_set_dfs()

    end

    # We can only safely add a pair to a set if the new pair
    # does not contain any members that already exist in the set
    #
    # @param set [Array<ScheduledPair>]
    # @param pair [ScheduledPair]
    def can_add_pair_to_set?(set, pair)
      current_names = set.flat_map(&:unpack).compact.map(&:name)
      names_in_pair = pair.unpack.compact.map(&:name)
      current_names.intersection(names_in_pair).empty?
    end
  end
end