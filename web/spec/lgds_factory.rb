class LGDSFactory
  def member(name:, id: nil)
    LGDS::Domain::Member.new(name: name, id: id)
  end

  def pair(left, right)
    LGDS::Domain::ScheduledPair.pair(left, right)
  end

  def bye_pair(member)
    LGDS::Domain::ScheduledPair.bye(member)
  end

  def scheduled_set(pairs)
    LGDS::Domain::ScheduledSet.new(pairs)
  end
end