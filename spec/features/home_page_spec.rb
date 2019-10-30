require "rails_helper"

RSpec.feature "Widget management", type: :feature do
  before do
    basic_auth("admin", "adminpassword")
    visit '/'
  end
  scenario "User creates a new widget", js: true do
    visit '/'
    expect(page).to have_text("Dobra Noc")
  end
end
