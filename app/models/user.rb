require 'bcrypt'

class User < ActiveRecord::Base
  # users.password_hash in the database is a :string
  include BCrypt

  def password
    @password ||= Password.new(digest)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.digest = @password
  end
end
