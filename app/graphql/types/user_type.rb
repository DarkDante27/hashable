module Types
  class UserType < Types::BaseObject
    field :id, ID, null: false
    field :username, String, null: true
    field :email, String, null: true
    field :bio, String, null: true
    field :created_at, String, null: true
    field :miniposts, [MinipostType], null: true
  end
end
