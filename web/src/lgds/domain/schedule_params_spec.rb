RSpec.describe LGDS::Domain::ScheduleParams do
  it 'can be created' do
    params = described_class.new(start_date: Date.new(2021, 05, 01))
    expect(params).to be_instance_of(LGDS::Domain::ScheduleParams)
  end
end
