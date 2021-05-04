RSpec.describe LGDS::Domain::GeneratedSchedule do
  before do
    @factory = LGDSFactory.new
  end

  it 'ensures schedule is not empty on creation' do
    expect do
      described_class.new([])
    end.to raise_error(RuntimeError, 'Generated schedule must not be empty.')
  end

  it 'ensures schedule sets are all the same size' do
    expect do
      described_class.new([
        @factory.scheduled_set([
          @factory.pair(@factory.member(name: 'A'), @factory.member(name: 'B'))
        ]),
        @factory.scheduled_set([
          @factory.pair(@factory.member(name: 'A'), @factory.member(name: 'B')),
          @factory.bye_pair(@factory.member(name: 'C'))
        ])
      ])
    end.to raise_error(RuntimeError, 'All schedule sets must be the same size.')
  end

  it 'ensures all pairs within schedules are unique' do
    expect do
      described_class.new([
        @factory.scheduled_set([
          @factory.pair(@factory.member(name: 'A'), @factory.member(name: 'B'))
        ]),
        @factory.scheduled_set([
          @factory.pair(@factory.member(name: 'A'), @factory.member(name: 'B')),
        ])
      ])
    end.to raise_error(RuntimeError, 'All pairs within entire schedule must be unique.')
  end
end
