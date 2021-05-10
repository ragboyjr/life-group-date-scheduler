module LGDS::Members
  # global configured services (poor man's ioc container)
  class Services
    def initialize
      raise 'cannot be instantiated.'
    end

    # @return [Domain::MemberRepository]
    def member_repository

    end
  end
end