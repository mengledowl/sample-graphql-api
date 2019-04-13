module Types
  class QueryType < Types::BaseObject
    field :users, [UserType], 'Retrieve a list of all users', null: false
    def users
      User.all
    end

    field :user_by_id, UserType, 'Retrieve a single user by ID', null: true do
      argument :id, ID, 'The unique ID of the user to retrieve', required: true
    end
    def user_by_id(id:)
      User.find_by(id: id)
    end

    field :user_by_email, UserType, 'Retrieve a single user by their email', null: true do
      argument :email, String, 'The email of the user to retrieve', required: true
    end
    def user_by_email(email:)
      User.find_by(email: email)
    end

    field :posts, [PostType], 'Retrieve a list of all posts', null: false
    def posts
      Post.all
    end

    field :post, PostType, 'Retrieve a single post by ID', null: false do
      argument :id, ID, 'The unique ID of the post to retrieve', required: true
    end
    def post(id:)
      Post.find_by(id: id)
    end
  end
end
