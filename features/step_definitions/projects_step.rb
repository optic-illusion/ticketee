require 'uri'

Given /^I am on the homepage$/ do
  visit projects_path # express the regexp above with the code you wish you had
end

When /^I follow "(.*?)"$/ do |link|
  click_link link # express the regexp above with the code you wish you had
end

When /^I fill in "(.*?)" with "(.*?)"$/ do |field, value|
  fill_in field, :with => value # express the regexp above with the code you wish you had
end

When /^I press "(.*?)"$/ do |link|
  click_button link # express the regexp above with the code you wish you had
end

Then /^I should see "(.*?)"$/ do |content|
  assert page.has_content?(content) # express the regexp above with the code you wish you had
end

Then /^I should be on the project page for "([^\"]*)"$/ do |page_name|
  current_path = URI.parse(current_url).path
  if current_path.respond_to? :should
    current_path.should == project_path(Project.find_by_name!(page_name))
  else
    assert_equal project_path(Project.find_by_name!(page_name)), current_path
  end
end