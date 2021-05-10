class LGDSFactory
  def member(name:, id: nil)
    LGDS::Members::Domain::Member.new(name: name, id: id)
  end

  def pair(left, right)
    LGDS::Scheduling::Domain::ScheduledPair.pair(left, right)
  end

  def bye_pair(member)
    LGDS::Scheduling::Domain::ScheduledPair.bye(member)
  end

  def scheduled_set(pairs)
    LGDS::Scheduling::Domain::ScheduledSet.new(pairs)
  end
end