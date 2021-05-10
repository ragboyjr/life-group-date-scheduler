module LGDS::Members::Domain
  class MemberRepository
    # @param id [Integer]
    # @return [Member]
    def get(id)
      raise 'not implemented.'
    end

    # @param id [Integer]
    # @return [Member, nil]
    def find(id)
      raise 'not implemented.'
    end

    # @param member [Member]
    def save(member)
      raise 'not implemented.'
    end
  end
end