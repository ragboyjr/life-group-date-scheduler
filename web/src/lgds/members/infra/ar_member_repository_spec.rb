require 'rails_helper'

RSpec.describe LGDS::Members::Infra::ARMemberRepository do

  before do
    @factory = LGDSFactory.new

    # @type [LGDS::Members::Infra::ARMemberRepository]
    @repo = described_class.new
  end


  it 'can save new members' do
    @repo.save(@factory.member(name: "Test 1"))
    expect(Member.find_by(name: "Test 1")).to be_instance_of(Member)
  end

  it 'can update existing members' do
    member = @factory.member(name: "Test 1")
    @repo.save(member)
    member.change_name("Test 2")
    @repo.save(member)

    expect(Member.find(1).name).to eq("Test 2")
  end

  it 'can find existing member by id' do
    @repo.save(@factory.member(name: 'Test 1'))
    expect(@repo.find(1).name).to eq('Test 1')
  end

  it 'returns nil when finding a non-existent member id ' do
    expect(@repo.find(1)).to be_nil
  end
end
