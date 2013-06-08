require 'spec_helper'

feature "update a spec" do
  let!(:resume) {Factory(:resume)}
  let!(:education) {Factory(:education, :resume => resume)}

  before do
    visit '/'
    click_link resume.name
    click_link education.name
    click_link "Edit Education"
  end

  scenario "edit an education" do
    fill_in "Name", :with => "A new education"
    fill_in "Description", :with => "Some new description."
    click_button "Update Education"
    page.should have_content("Updated education.")
    page.should have_content("A new education")

    page.should_not have_content(education.name)
  end

  scenario "invalid data" do
    fill_in "Name", :with => ""
    fill_in "Description", :with => ""
    click_button "Update Education"
    page.should have_content("Could not update education.")
    page.should have_content("can't be blank")
  end
end


