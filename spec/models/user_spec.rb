require 'rails_helper'

RSpec.describe User, type: :model do  

  describe 'Validations' do
    
    # validation tests/examples here
    it 'must be created with a password and password confirmation' do
      @user = User.create(name: 'Bill', email: "bill@gmail.com", password: "labber", password_confirmation: "labber")

      expect(@user).to be_valid
    end

    it 'throws an error if the password and confirmation do not match' do
      @user = User.create(name: 'Bill', email: "bill@gmail.com", password: "labber", password_confirmation: "labber123")

      expect(@user).to_not be_valid
    end

    it 'throws an error when emails are not unique' do
      @user1 = User.create(name: 'Bill', email: "bill@gmail.com", password: "labber", password_confirmation: "labber")
      @user2 = User.create(name: 'Ben', email: "bill@gmail.com", password: "labber", password_confirmation: "labber")

      expect(@user1).to be_valid
      expect(@user2.errors.full_messages).to include("Email has already been taken")
    end

    it 'a user must have an email, first-name and last-name' do
      @user = User.create(name: 'Bill', email: "bill@gmail.com", password: "labber", password_confirmation: "labber")

      expect(@user).to be_valid
    end    
    
  describe '.authenticate_with_credentials' do
        # examples for this class method here
    it 'is valid with correct user password' do
      @user = User.create(name: 'Bill', email: "bill@gmail.com", password: "labber", password_confirmation: "labber")
      @testUser = User.authenticate_with_credentials("bill@gmail.com", "labber")
      expect(@testUser).to eq(@user)
    end
  end

  end
end