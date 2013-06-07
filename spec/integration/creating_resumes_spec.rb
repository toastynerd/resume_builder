require 'spec_helper'

feature "creating a resume" do
  before do
    visit '/'
    click_link "New Resume"
  end

  scenario "Create a new resume" do
    fill_in "Name", :with => "Some new resume"
    fill_in "Description", :with => "A new resume to use."
    click_button "Create Resume"
    page.should have_content("Created a new resume")
  end
end
