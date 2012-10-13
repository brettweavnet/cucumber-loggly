When /^I access account (.*)$/ do |account|
  @input = []
  @query = []
  @from  = "NOW-1HOUR"
  config = LogglyRubyClient::Config.new :account => account
  @loggly = LogglyRubyClient::Search.new :config => config
end

And /^I search input (.*)$/ do |input|
  @input << input
end

And /^I search back (\d+) (.*)$/ do |num, duration|
  @from = "NOW-#{num}#{duration.upcase}"
end

And /^I query for (.*)$/ do |query|
  @query << query
  result = @loggly.search :from  => @from,
                          :query => @query,
                          :input => @input
  @num_found = result[:body]["numFound"].to_i
end

Then /^I should find at least (\d+) occurances$/ do |num|
  @num_found > num.to_i
end

Then /^I should less than (\d+) occurances$/ do |num|
  @num_found < num.to_i
end

Then /^I should find no occurances$/ do
  @num_found == 0
end
