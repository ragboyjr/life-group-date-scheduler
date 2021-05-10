module LGDS::Scheduling::Domain
  class GeneratedSchedule
    include Enumerable

    # @param scheduled_sets [Array<ScheduledSet>]
    def initialize(scheduled_sets)
      assert_schedule_is_not_empty(scheduled_sets)
      assert_sets_are_same_size(scheduled_sets)
      assert_unique_pairs_across_all_sets(scheduled_sets)
      @scheduled_sets = scheduled_sets
    end

    def each(&block)
      @scheduled_sets.each(&block)
    end

    private

    # @param scheduled_sets [Array<ScheduledSet>]
    def assert_schedule_is_not_empty(scheduled_sets)
      raise 'Generated schedule must not be empty.' if scheduled_sets.empty?
    end

    # @param scheduled_sets [Array<ScheduledSet>]
    def assert_sets_are_same_size(scheduled_sets)
      first_size = scheduled_sets[0].size
      raise 'All schedule sets must be the same size.' if scheduled_sets.any? { |set| set.size != first_size }
    end

    # @param scheduled_sets [Array<ScheduledSet>]
    def assert_unique_pairs_across_all_sets(scheduled_sets)
      all_pairs = scheduled_sets.flat_map do |set|
        set.scheduled_pairs
      end
      raise 'All pairs within entire schedule must be unique.' if all_pairs.uniq.size != all_pairs.size
    end
  end
end

