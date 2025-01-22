class UserShowSerializer
  include JSONAPI::Serializer
  attributes :title

  belongs_to :user, serializer: UserSerializer
  belongs_to :show, serializer: ShowSerializer
end