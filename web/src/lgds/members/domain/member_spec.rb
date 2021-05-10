RSpec.describe LGDS::Members::Domain::Member do
  def domain
    LGDS::Members::Domain
  end

  it 'can create from command' do
    command = domain::CreateMember.new(name: 'Test 1')
    member = domain::Member.create(command)
    expect(member.name).to eq('Test 1')
  end
end
