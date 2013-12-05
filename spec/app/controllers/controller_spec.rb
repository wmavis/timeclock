require 'spec_helper'
 
describe Controller do
	describe "#new" do
		subject { Controller.new($client) }
		it { should be_an_instance_of(Controller) }
	end
end
