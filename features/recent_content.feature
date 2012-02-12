# language: en
Feature: Recent post
  In order to keep blog content fresh
  As a blogger
  I want to post content every three days

  Scenario: The projects page is updated weekly
	Given I am on the projects page
	And the page has a datestamp
	Then the page should be less than 7 days old

  Scenario: Most recent blog post is less than 3 days old
	Given I am on the most recent post
	And the page has a datestamp
	Then the post should be less than 3 days old