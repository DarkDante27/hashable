module Types
  class MinipostType < Types::BaseObject
    field :id, ID, null: true
    field :content, String, null: true
    field :created_at, String, null: true
    field :user_id, ID, null: true
    field :user, UserType, null: false
  end
end
