module Types
  class UserType < Types::BaseObject
    field :id, ID, null: false
    field :first_name, String, null: true
    field :last_name, String, null: true
    field :full_name, String, null: true
    field :email, String, null: false
    field :bio, String, null: true
    field :admin, Boolean, null: false
    field :posts, [Types::PostType], null: true
    field :comments, [Types::CommentType], null: true
    field :liked_posts, [Types::PostType], null: true
  end
end
