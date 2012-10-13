When /^I access loggly account (.*)$/ do |account|
  @input = []
  @query = []
  @from  = "NOW-1HOUR"
  @loggly = CucumberLoggly::Connect.new account
end

And /^I search back (\d+) (.*)$/ do |num, duration|
  @from = "NOW-#{num}#{duration.upcase}"
end

And /^I include input (.*)$/ do |input|
  @input << input
end

And /^I include query (.*)$/ do |query|
  @query << query
end

Then /^I should find at least (\d+) occurances?$/ do |num|
  @loggly.search(:query => @query,
                 :input => @input,
                 :from  => @from).should be >= num.to_i
end

Then /^I should find less than (\d+) occurances?$/ do |num|
  @loggly.search(:query => @query,
                 :input => @input,
                 :from  => @from).should be < num.to_i
end

Then /^I should find no occurances?$/ do
  @loggly.search(:query => @query,
                 :input => @input,
                 :from  => @from).zero?.should be_true
end
