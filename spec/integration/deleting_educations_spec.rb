require 'spec_helper'

feature "delete a education" do
  let!(:resume) {Factory(:resume)}
  let!(:education) {Factory(:education, :resume => resume)}

  before do
    visit '/'
    click_link resume.name
    click_link education.name
  end

  scenario "delete an education" do
    click_link "Delete Education"
    page.should have_content("Education deleted.")

    page.should_not have_content(education.name)
  end
end
