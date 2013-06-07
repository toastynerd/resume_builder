require 'spec_helper'

feature "edit a resume" do
  let!(:resume) {Factory(:resume)}

  before do
    visit '/'
    click_link resume.name
    click_link "Edit Resume"
  end

  scenario "editing a resume" do
    fill_in "Name", :with => "Some new resume"
    click_button "Update Resume"
    page.should have_content("Resume info has been updated.")
  end

  scenario "editing with invalid data" do
    fill_in "Name", :with => ""
    fill_in "Description", :with => ""
    click_button "Update Resume"
    page.should have_content("Could not update resume")
    page.should have_content("can't be blank") #simple form has an odd way of displaying error messages
  end
end

