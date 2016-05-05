require 'bcrypt'

class User
  include DataMapper::Resource

  property :id, Serial
  property :email, String
  property :password, String

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(pwd)
    @password = Password.create(pwd)
    self.password_hash = @password
  end

end
