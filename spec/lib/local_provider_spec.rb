require 'spec_helper'
require './lib/data_den'
require './lib/local_provider'

describe DataDen::LocalProvider do
  describe "basic properties" do
    subject { DataDen::LocalProvider.new }
    it { subject.path.should eq '/tmp' }
  end

  describe "simple write" do
    subject { DataDen::LocalProvider.new }
    it "should raise exception if put has not enough params" do
      expect { subject.put }.to raise_error { ArgumentError }
      expect { subject.put("ede") }.to raise_error { ArgumentError }
      expect { subject.put("ede", nil) }.to raise_error { ArgumentError }
    end
    it "should write data" do
      subject.put("some_file.txt", "data is the key").should be_true
      IO.read("/tmp/some_file.txt").should eq "data is the key"
      File.delete("/tmp/some_file.txt")
    end
    it "should throw an exception if the file doesn't exist" do
      expect { subject.get("czec") }.to raise_error { Errno::ENOENT }
    end
    it "should read data" do
      subject.put("some_file.txt", "data is the key")
      subject.get("some_file.txt").should eq "data is the key"
    end
  end
end
