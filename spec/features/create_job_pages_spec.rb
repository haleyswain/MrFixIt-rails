require 'rails_helper'

describe 'the path to adding a job' do
  it 'allows a user to create a job' do
    visit root_path
    click_on "Add Your Job"
    fill_in "Title", with: 'scrub the zebra'
    fill_in 'Description', with: 'once per day'
    click_on 'Create Job'
    expect(page).to have_content "scrub the zebra"
  end
end
