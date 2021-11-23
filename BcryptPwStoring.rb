# frozen_string_literal: true

# Password storing using bcrypt.
# To be converted into a Ruby "module"

module BcryptPwStoring
  require 'bcrypt'

  def self.create_hash_digest(password)
    BCrypt::Password.create(password)
  end

  def self.verify_hash_digest(password)
    BCrypt::Password.new(password)
  end

  def self.create_secure_users_list(list_of_users)
    list_of_users.each do |user_record|
      password = user_record[:password]
      user_record[:password] = create_hash_digest(password)
    end
    list_of_users
  end

  def self.authenticate_user(username, password, list_of_users)
    list_of_users.each do |user_record|
      if user_record[:username] == username && verify_hash_digest(user_record[:password]) == password
        return user_record
      end
    end
    'User record not found!'
  end

  # new_users = create_secure_users_list(users)
  #
  # puts authenticate_user('junior', 'password6', new_users)
end
