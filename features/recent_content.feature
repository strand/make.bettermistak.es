# language: en
Feature: Recent post
  In order to keep blog content fresh
  As a blogger
  I want to post content every three days

  Scenario: Most recent blog post is less than 3 days old
    Given I am on the homepage
     When I follow the most recent post link
     Then the post should be less than 72 hours old