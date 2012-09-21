require 'spec_helper'
require './lib/data_den'

describe DataDen do

  describe "Testing basic properties" do
    it "should raise an exception if it doesn't have a provider" do
      expect { DataDen.provider }.to raise_error { DataDen::NoProviderException }
    end
    it "should get a provider" do
      DataDen.store = "blah"
      DataDen.provider.should_not eq nil
    end
  end
end
