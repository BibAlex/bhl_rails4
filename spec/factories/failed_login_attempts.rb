FactoryGirl.define do
  factory :failed_login_attempt do
    ip "MyString"
username "MyString"
number_of_login_attempts 1
  end

end
