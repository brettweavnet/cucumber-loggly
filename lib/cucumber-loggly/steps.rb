When /^I access loggly account (.*)$/ do |account|
  @loggly = CucumberLoggly::Search.new :account => account
end

And /^I search back (\d+) (.*)$/ do |num, duration|
  @loggly.from = "NOW-#{num}#{duration.upcase}"
end

And /^I include input (.*)$/ do |input|
  @loggly.input << input
end

And /^I include query (.*)$/ do |query|
  @loggly.query << query
end

Then /^I should find at least (\d+) occurances?$/ do |num|
  @loggly.search.should be >= num.to_i
end

Then /^I should find less than (\d+) occurances?$/ do |num|
  @loggly.search.should be < num.to_i
end

Then /^I should find no occurances?$/ do
  @loggly.search.zero?.should be_true
end
