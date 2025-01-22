class ShowSerializer
  include JSONAPI::Serializer
  attributes :date, :start_time, :end_time

  belongs_to :artist
  belongs_to :stage
end