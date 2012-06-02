require 'spec_helper'

describe "sign up" do
	before(:each) do

		visit new_user_registration_path
		fill_in "user_email", :with => "markawil@live.com"
		fill_in "user_password", :with => "password"
		fill_in "user_password_confirmation", :with => "password"
		click_button "Sign up"
		#save_and_open_page

	end

	it "should sign me in" do
		within "#user_info" do
			page.should have_content "markawil@live.com"
		end
		page.should have_css "#user_info"
	end

	it "should create my account" do
		user = User.where(:email => "markawil@live.com").first
		user.should_not be_nil
		user.nil?.should == false
	end
end