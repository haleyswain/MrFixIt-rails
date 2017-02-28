require 'rails_helper'

describe "claiming a job" do
  it "allows a worker to claim a job" do
    worker = FactoryGirl.create(:worker)
    visit root_path
    click_on 'Log In as Worker'
    fill_in 'worker_email', :with => 'worker@person.com'
    fill_in 'worker_password', :with => 'password'
    click_on 'Log in'
    expect(page).to have_content "Welcome to Mr. Fix-It!"
    click_on 'Add Your Job'
    fill_in "Title", with: 'scrub the zebra'
    fill_in 'Description', with: 'once per day'
    click_on 'Create Job'
    expect(page).to have_content "scrub the zebra"
    click_on "See All Jobs"
    click_on 'scrub the zebra'
    click_on "click here to claim it now"
    click_on "Worker Dashboard"
    expect(page).to have_content "scrub the zebra"
  end
end
