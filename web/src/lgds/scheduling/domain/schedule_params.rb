require 'dry-struct'
# require 'date'

module LGDS::Scheduling::Domain
  class ScheduleParams < Dry::Struct
    attribute :iterations, LGDS::Types::Strict::Integer.default(1)
    attribute :start_date, LGDS::Types.Instance(Date)
    attribute :interval_duration_in_weeks, LGDS::Types::Strict::Integer.default(2)
  end
end
