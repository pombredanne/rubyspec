require File.dirname(__FILE__) + '/../../spec_helper'
require 'delegate'

describe "SimpleDelegator when frozen" do
  before :each do
    @array = [42, :hello]
    @delegate = SimpleDelegator.new(@array)
    @delegate.freeze
  end

  it "is still readable" do
    @delegate.should == [42, :hello]
    @delegate.include?("bar").should be_false
  end

  it "is frozen" do
    @delegate.frozen?.should be_true
  end

  ruby_bug "redmine:2221", "1.8.7" do
    it "is not writeable" do
      lambda{ @delegate[0] += 2 }.should raise_error( RuntimeError )
    end

    it "creates a frozen clone" do
      @delegate.clone.frozen?.should be_true
    end
  end

  it "creates an unfrozen dup" do
    @delegate.dup.frozen?.should be_false
  end
  
  # --- not sure?
  # it "cannot be reassigned" do
  #   lambda{ @delegate.__setobj__("hola!") }.should raise_error( RuntimeError )
  # end
end
