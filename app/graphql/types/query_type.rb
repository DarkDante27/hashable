module Types
  class QueryType < Types::BaseObject
    field :users,
          [Types::UserType],
          null: false,
          description: "Returns a list of users in Hasher"

    def users
      User.all
    end

    field :user, UserType, null: true do
      description "Find a user by id"
      argument :id, ID, required: true
    end

    def user(id:)
      User.find(id)
    end

    field :miniposts, [MinipostType], null: true do
      description "Get all Miniposts"
    end

    def miniposts
      Minipost.all
    end

    field :minipost, MinipostType, null: true do
      description "Find a minipost by id"
      argument :id, ID, required: true
    end

    def minipost(id:)
      Minipost.find(id)
    end
  end
end
