require 'uri'

Then /^I should (not )?see "([^"]*?)" within "([^"]*?)"$/ do |not_see, content, parent|
  if not_see
    page.should_not have_css(parent, :text=>content)
  else
    page.should have_css(parent, :text=>content)
  end
end

Given /^that project has a ticket:$/ do |table|
  table.hashes.each do |attributes|
    @project.tickets.create!(attributes)
  end
end
