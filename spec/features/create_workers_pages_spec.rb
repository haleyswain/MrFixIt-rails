require 'rails_helper'

describe Worker do
  it 'creates a worker account' do
    user = FactoryGirl.build(:worker)
    visit root_path
    click_on 'Register as a Worker'
    fill_in 'worker_email', :with => 'worker@person.com'
    fill_in 'worker_password', :with => 'password'
    fill_in 'worker_password_confirmation', :with => 'password'
    click_on 'Sign up'
    expect(page).to have_content 'Welcome to Mr. Fix-It!'
  end

  it 'allows users to sign in to their account' do
    user = FactoryGirl.create(:worker)
    visit root_path
    click_on 'Log In as Worker'
    fill_in 'worker_email', :with => 'worker@person.com'
    fill_in 'worker_password', :with => 'password'
    click_on 'Log in'
    expect(page).to have_content "Welcome to Mr. Fix-It!"
  end
end
