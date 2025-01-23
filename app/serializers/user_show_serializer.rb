class UserShowSerializer
  include JSONAPI::Serializer
  
  belongs_to :user, serializer: UserSerializer
  belongs_to :show, serializer: ShowSerializer
end