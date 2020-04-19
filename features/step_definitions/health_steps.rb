require 'capybara/rspec'

When("A user makes a get request to the homepage") do
  get '/'
end

Then("The user sees a json response") do
  pending # Write code here that turns the phrase above into concrete actions
end