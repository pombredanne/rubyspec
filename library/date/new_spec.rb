require 'date'
require File.expand_path('../../../spec_helper', __FILE__)
require File.expand_path('../shared/civil', __FILE__)

describe "Date#new" do

  it_behaves_like(:date_civil, :new)

end

describe "Date.new" do
  it "needs to be reviewed for spec completeness"
end

describe "Date.new!" do
  it "needs to be reviewed for spec completeness"
end
