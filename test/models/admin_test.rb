require "test_helper"

class AdminTest < ActiveSupport::TestCase
  
  test "admin email should be present" do
    admin = Admin.create(email: "",
                         password: "foobar",
                         password_confirmation: "foobar")
    assert admin.invalid?
  end

  test "admin password should be present" do
    admin = Admin.create(email: "email@example.com",
                         password: "",
                         password_confirmation: "")
    assert admin.invalid?
  end

  test "email must be valid" do
    admin = Admin.create(email: "examplemail",
                             password: "foobar",
                             password_confirmation: "foobar")
    assert admin.invalid?
  end

  test "email should be downcased" do
    admin = Admin.create(email: "EMAIL@MAIL.COM",
                         password: "foobar",
                         password_confirmation: "foobar")
    assert_equal "email@mail.com", admin.email 
  end

end
