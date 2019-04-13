module Types
  class PostType < Types::BaseObject
    field :id, ID, null: false
    field :body, String, null: false
    field :user, Types::UserType, null: false
    field :comments, [Types::CommentType], null: true
    field :likes, [Types::LikeType], null: true
  end
end
