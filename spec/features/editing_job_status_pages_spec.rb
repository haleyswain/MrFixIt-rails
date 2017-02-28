require "rails_helper"

describe "editing the status of a job" do
  it "allows a worker to specify whether a job is pending, active or completed" do
    worker = FactoryGirl.create(:worker)
    job = FactoryGirl.create(:job)
    visit root_path
    click_on 'Log In as Worker'
    fill_in 'worker_email', :with => 'worker@person.com'
    fill_in 'worker_password', :with => 'password'
    click_on 'Log in'
    expect(page).to have_content "Welcome to Mr. Fix-It!"
    click_on 'See All Jobs'
    expect(page).to have_content "Water the Garden"
    click_on "See All Jobs"
    click_on 'Water the Garden'
    click_on "click here to claim it now"
    click_on "See All Jobs"
    click_on "Water the Garden"
    expect(page).to have_content "You claimed this job. Its currently pending!"
  end

  it "allows a user to mark a job as active" do
    worker = FactoryGirl.create(:worker)
    job = FactoryGirl.create(:job)
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
    click_on "Active"
    click_on "See All Jobs"
  end
end
