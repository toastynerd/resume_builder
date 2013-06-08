require 'spec_helper'

feature "creating educations" do
  let!(:resume) {Factory(:resume)}
  let!(:education) {Factory(:education, :resume => resume)}

  before do
    visit '/'
    click_link resume.name
  end

  scenario "create an education" do
    click_link "Add Education"
    fill_in "Name", :with => "Getting edumicated"
    fill_in "Description", :with => "All on my owns"
    click_button "Create Education"
    page.should have_content("Created new education.")
  end

  scenario "don't create with invalid fields" do
    click_link "Add Education"
    fill_in "Name",  :with => ""
    fill_in "Description", :with => ""
    click_button "Create Education"
    page.should have_content("Could not create education.")
    page.should have_content("can't be blank")
  end
end
