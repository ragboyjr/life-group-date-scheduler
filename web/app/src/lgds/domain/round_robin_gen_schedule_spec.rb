RSpec.describe LGDS::Domain::RoundRobinGenSchedule do
  def member(id:, name:)
    LGDS::Domain::Member.new(name: name, id: id)
  end

  def given_the_following_members(*members)
    @members = members
  end

  def when_the_schedule_is_generated
    @result = described_class.new.(@members)
  end

  def then_the_generated_schedule_matches(schedule_def)
    # @type scheduled_set [LGDS::Domain::ScheduledSet]
    actual_def = @result.map do |scheduled_set|
      # @type pair [LGDS::Domain::ScheduledPair]
      scheduled_set.scheduled_pairs.map do |pair|
        pair.unpack.map do |member|
          member == nil ? nil : member.name
        end
      end
    end

    expect(schedule_def).to eq(actual_def)
  end

  it 'can generate a schedule for a single member' do
    given_the_following_members(
      member(id: 1, name: 'A')
    )
    when_the_schedule_is_generated
    then_the_generated_schedule_matches([
      [['A', nil]]
    ])
  end
end
