require 'rails_helper'

RSpec.describe User, type: :model do
  subject {User.new first_name: "Ralf", last_name:"Pinheiro", email: "test@ralf.com", password: "LALFLALF", password_confirmation: "LALFLALF" }
  describe 'Validations' do
    it "is a valid user" do
      expect(subject).to be_valid
    end
    it "has a valid first name" do
      subject.first_name = nil
      expect(subject).not_to be_valid
    end
    it "has a valid last_name" do
      subject.last_name = nil
      expect(subject).not_to be_valid
    end
    it "has a valid email" do
      subject.email = nil
      expect(subject).not_to be_valid
    end
    it "has a valid password" do
      subject.password = "RALF"
      expect(subject.password).not_to eq(subject.password_confirmation)
    end
    it "validates email uniqueness" do
      User.create first_name: "Eduardo", last_name:"Dias", email: "test1@ralf.com", password: "LALFLALF", password_confirmation: "LALFLALF"
      expect(subject).to be_valid
    end
    it "checks password length min 6" do
      subject.password = "lalf"
      expect(subject).not_to be_valid
    end
  end
  describe '.authenticate_with_credentials' do
    user = User.create first_name: "Peter", last_name:"Chagas", email: "test@test.com", password: "LALFLALF", password_confirmation: "LALFLALF"

    it "has an existing email" do
      loggedUser = User.authenticate_with_credentials("     tesT@test.com","LALFLALF")
      expect(loggedUser.email).to eq(user.email)
    end
    it "email doesnt match" do
      loggedUser = User.authenticate_with_credentials("tes@test.com","LALFLALF")
      expect(loggedUser).to eq(nil)
    end
    it "password doesnt match" do
      loggedUser = User.authenticate_with_credentials("test@test.com","LFLALF")
      expect(loggedUser).to eq(nil)
    end
  end
end
