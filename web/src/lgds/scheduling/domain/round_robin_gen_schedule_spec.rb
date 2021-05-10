RSpec.describe LGDS::Scheduling::Domain::RoundRobinGenSchedule do
  before do
    @factory = LGDSFactory.new
  end

  def member(name:, id: nil)
    @factory.member(name: name, id: id)
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
    expect(actual_def).to eq(schedule_def)
  end

  # def then_the_generated_schedule

  it 'can generate a schedule for a single member' do
    given_the_following_members(
      member(name: 'A')
    )
    when_the_schedule_is_generated
    then_the_generated_schedule_matches([
      [['A', nil]]
    ])
  end

  it 'can generate a schedule for two members' do
    given_the_following_members(
      member(name: 'B'),
      member(name: 'A'),
    )
    when_the_schedule_is_generated
    then_the_generated_schedule_matches([
      [['A', 'B']]
    ])
  end

  it 'can generate a schedule for three members' do
    given_the_following_members(
      member(name: 'A'),
      member(name: 'B'),
      member(name: 'C'),
    )
    when_the_schedule_is_generated
    then_the_generated_schedule_matches([
      [
        ['A', nil],
        ['B', 'C']
      ],
      [
        ['A', 'C'],
        ['B', nil]
      ],
      [
        ['A', 'B'],
        ['C', nil]
      ],
    ])
  end

  it 'can generate a schedule for four members' do
    given_the_following_members(
      member(name: 'A'),
      member(name: 'B'),
      member(name: 'C'),
      member(name: 'D'),
    )
    when_the_schedule_is_generated
    then_the_generated_schedule_matches([
      [
        ['A', 'D'],
        ['B', 'C']
      ],
      [
        ['A', 'C'],
        ['B', 'D']
      ],
      [
        ['A', 'B'],
        ['C', 'D']
      ],
    ])
  end

  it 'can generate a schedule for six members' do
    given_the_following_members(
      member(name: 'A'),
      member(name: 'B'),
      member(name: 'C'),
      member(name: 'D'),
      member(name: 'E'),
      member(name: 'F'),
    )
    when_the_schedule_is_generated
    then_the_generated_schedule_matches([
      [
        ['A', 'F'],
        ['B', 'E'],
        ['C', 'D'],
      ],
      [
        ['A', 'E'],
        ['D', 'F'],
        ['B', 'C'],
      ],
      [
        ['A', 'D'],
        ['C', 'E'],
        ['B', 'F'],
      ],
      [
        ['A', 'C'],
        ['B', 'D'],
        ['E', 'F'],
      ],
      [
        ['A', 'B'],
        ['C', 'F'],
        ['D', 'E'],
      ],
    ])
  end
end