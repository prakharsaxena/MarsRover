require 'spec_helper'

ruby_script = './MarsRover.rb'

describe ruby_script do
  it "exits cleanly" do
    status, output = run ruby_script, test_file

    status.to_i.should eq(0),
      "## status: #{status.inspect} \n## pinfo: #{output.inspect}"
  end

  it "produces the correct output" do
    status, output = run ruby_script, test_file

    output.stdout.should eq("1 3 N\n5 1 E\n")
  end
end

