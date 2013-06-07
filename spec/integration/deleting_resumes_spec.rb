require 'spec_helper'

feature "delete resumes" do
  let!(:resume) {Factory(:resume)}

  before do
    visit '/'
    click_link resume.name
  end

  scenario "delete a resume" do
    click_link "Delete Resume"
    page.should have_content("Resume has been deleted.")

    visit '/'
    page.should_not have_content(resume.name)
  end
end
