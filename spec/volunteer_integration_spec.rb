require "capybara/rspec"
require "./app"

Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('the volunteer path', {:type => :feature}) do

  it ('Takes user input project name and adds it to the projects list.') do
    visit('/')
    fill_in('project_name', :with => 'sweeping the city')
    click_button('Add')
    click_link('Return Home')
    expect(page).to have_content('sweeping')
  end

  it ('Takes user input project name and adds it to the projects list.') do
    visit('/')
    fill_in('project_name', :with => 'Trim the trees')
    click_button('Add')
    click_link('Return Home')
    click_link('Trim the trees')
    click_link('Edit Trim the trees name')
    fill_in('project_name', :with => 'Trim the trees and bushes')
    click_button('Update')
    expect(page).to have_content('Trim the trees and bushes')
  end

  it ('Takes user input project name and adds it to the projects list.') do
    visit('/')
    fill_in('project_name', :with => 'Trim the trees')
    click_button('Add')
    click_link('Return Home')
    click_link('Trim the trees')
    click_link('Edit Trim the trees name')
    fill_in('project_name', :with => 'Trim the trees and bushes')
    click_button('Delete project')
    visit('/')
    expect(page).to have_content('There are no projects yet!')
  end

  it ('Takes user input project name and adds it to the projects list.') do
    visit('/')
    fill_in('project_name', :with => 'sweep')
    click_button('Add')
    click_link('Return Home')
    expect(page).to have_content('sweep')
  end

  it ('Takes user volunteer name and adds it to the volunteer list.') do
    visit('/')
    fill_in('project_name', :with => 'sweep')
    click_button('Add')
    click_link('Return Home')
    click_link('sweep')
    fill_in('name', :with => 'Kyle')
    click_button('Add Volunteer')
    click_link('Return Home')
    click_link('sweep')
    click_link('Kyle')
    expect(page).to have_content('Kyle')
  end

  it ('tests the update funtion of volunteer name') do
    visit('/')
    fill_in('project_name', :with => 'sweep')
    click_button('Add')
    click_link('Return Home')
    click_link('sweep')
    fill_in('name', :with => 'Kyle')
    click_button('Add Volunteer')
    click_link('Return Home')
    click_link('sweep')
    click_link('Kyle')
    click_link('Edit Kyle data')
    fill_in('volunteer_name', :with => 'Kyle Keyboard')
    click_button('Update')
    expect(page).to have_content('Kyle Keyboard')
  end

  it ('tests the delete funtion of volunteer name') do
    visit('/')
    fill_in('project_name', :with => 'sweep')
    click_button('Add')
    click_link('Return Home')
    click_link('sweep')
    fill_in('name', :with => 'Kyle')
    click_button('Add Volunteer')
    click_link('Return Home')
    click_link('sweep')
    click_link('Kyle')
    click_link('Edit Kyle data')
    click_button('Delete Volunteer from their duty')
    click_link('Return to Main Page')
    click_link('sweep')
    expect(page).to have_no_content('Kyle')
  end
end
