require 'uri'
When /^(?:|I) fill in "([^"]*)" with "([^"]*)"$/ do |field,value|
  fill_in(field, :with => value)
end
When /^(?:|I) follow "([^"]*)"$/ do |link|
  click_link(link)
end
When /^(?:|I) select "([^"]*)" from "([^"]*)"$/ do |value,field|
  select(value, :from => field)
end
Then /^(?:|I) should see "([^"]*)"$/ do |text|
  if page.respond_to? :should
    page.should have_content(text)
  else
    assert page.has_content?(text)
  end
end
When /^(?:|I) press "([^"]*)"$/ do |button|
  click_button(button)
end
Then /^(?:|I) should not see "([^"]*)"$/ do |text|
  if page.respond_to? :should
    page.should have_no_content(text)
  else
    assert page.has_no_content?(text)
  end
end
