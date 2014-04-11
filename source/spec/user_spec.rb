require 'spec_helper'
require 'json'

describe "User creation" do
   it "should create with valid email" do
    no_email = User.create(name: "test", email: "invalid@dsf.com")
    p no_email
    no_email.email.should eq("invalid@dsf.com")
  end

  it "should not create with invalid email" do
    no_email = User.new(name: "", email: "invalid")
    p no_email
    no_email.should eq(nil)
  end
end
