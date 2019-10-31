require "rails_helper"

RSpec.feature "Widget management", type: :feature, js: true do
  before do
    basic_auth('/')
  end
  scenario "User creates a new widget", js: true do
    expect(page).to have_text("Dobra Noc")
  end
end
