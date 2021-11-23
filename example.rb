# frozen_string_literal: true

# Password storing using bcrypt and BCryptPwStoring "module"

require_relative 'BcryptPwStoring'

users = [
  { username: 'joe', password: 'password1' },
  { username: 'andy', password: 'password2' },
  { username: 'arya', password: 'password3' },
  { username: 'katy', password: 'password4' },
  { username: 'lilly', password: 'password5' },
  { username: 'junior', password: 'password6' }
]

new_users = BcryptPwStoring.create_secure_users_list(users)
puts 'Username:'
username = gets.chomp
puts 'password:'
password = gets.chomp
puts BcryptPwStoring.authenticate_user(username, password, new_users)
