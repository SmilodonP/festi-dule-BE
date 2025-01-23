class UserSerializer
  include JSONAPI::Serializer
  attributes :username, :first_name, :last_name, :email
  has_many :shows, serializer: ShowSerializer

  def self.format_user(user)
    {
      data: {
        id: user.id.to_s,
        type: "user",
        attributes: {
          username: user.username,
          first_name: user.first_name,
          last_name: user.last_name,
          email: user.email
        },
        relationships: {
          shows: {
            data: user.shows.map do |show|
              {
                id: show.id.to_s,
                type: "show",
                attributes: {
                  artist: show.artist.name,
                  stage: show.stage.name,
                  date: show.date,
                  start_time: show.start_time,
                  end_time: show.end_time
                }
              }
            end
          }
        }
      }
    }
  end

    def self.format_users(users)
      { 
        data: users.map do |user|
          {
            id: user.id.to_s,
            type: "user", 
            attributes: {
              username: user.username,
              first_name: user.first_name,
              last_name: user.last_name,
              email: user.email
            }
          }
      end
    }
  end
end
