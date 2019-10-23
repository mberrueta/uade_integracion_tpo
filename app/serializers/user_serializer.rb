class UserSerializer < ActiveModel::Serializer
  attributes :id, :name

  has_one :student
  has_one :holder
  has_one :admin_user
  has_one :employee
end
