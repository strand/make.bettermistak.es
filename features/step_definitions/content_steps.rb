Given /^I am on the homepage$/ do
  '/' # TODO reference root from config.yml
end

Given /^I am on the most recent post$/ do
  '/' # TODO reference root from config.yml
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

Then /^the post should be less than (\d+) hours old$/ do |hours|
  pending # express the regexp above with the code you wish you had
end