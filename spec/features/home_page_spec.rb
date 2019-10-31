require "rails_helper"

RSpec.feature "Home page management", type: :feature, js: true do
  before do
    basic_auth('/')
  end
  scenario "User creates a new widget"do
    binding.pry
    expect(page).to have_text("Dobra Noc")
  end
end
