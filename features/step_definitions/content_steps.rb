Given /^I am on the homepage$/ do
  '/' # TODO reference root from config.yml
end

Given /^I am on the projects page$/ do
  '/projects'
end

Given /^I am on the most recent post$/ do
  
end

Given /^the page has a datestamp$/ do
  sleep 3
  page.should have_xpath("//time/datetime[1]")
end

#When /^(?:|I )follow the most recent post link$/ do
#  most_recent_post = site.recent_posts.first
#  click_link(most_recent_post)
#end

#When /^(?:|I )am on the most recent post$/ do |link|
#  click_link(link)
#end

#When /^(?:|I )follow "([^"]*)"$/ do |link|
#  click_link(link)
#end

Then /^the (?:post|page) should be less than (\d+) days old$/ do |d|
  age_of_content = 4.days.ago # Replace with code which retrieves the timestamp from the current page.
  # time datetime="2011-10-12T11:42:00+08:00"
  age_of_content.should > d.to_i.days.ago
end