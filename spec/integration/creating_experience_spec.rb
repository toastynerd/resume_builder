require 'spec_helper'

feature "create an experience" do
  let!(:resume) {Factory(:resume)}

  before do
    visit '/'
    click_link resume.name 
    click_link "Add Experience"
  end

  scenario "Creat a new experience" do
    fill_in "Name", :with => "A new job experience"
    fill_in "Description", :with => "Getting so experienced" 
    click_button "Create Experience"
    page.should have_content("Created a new experience.")
  end

  scenario "invalid data should create a new experience" do
    fill_in "Name", :with => ""
    fill_in "Description", :with => ""
    click_button "Create Experience"
    page.should have_content("Could not create experience")
    page.should have_content("can't be blank")
  end
end
