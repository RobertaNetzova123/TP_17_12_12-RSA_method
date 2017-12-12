#require 'rspec'
require_relative '../lib/RSA.rb'

RSpec.describe RSA do

	message = "secret message"
	long_msg = "Let's try something longer and pray it will stil work :D "
	initialize = RSA.new(33,7,3)
	key = initialize.new_key
	random = RSA.new(key[0],key[1],key[2])

	it "checks n initialization" do
		expect (initialize.n). to eq 33
	end

	it "checks e initialization" do
		expect (initialize.e). to eq 7
	end
	
	it "checks d initialization" do
		expect (initialize.d). to eq 3
	end

	it "checks encrypt/decrypt with static keys" do
		expect(initialize.decrypt(initialize.encrypt(message))).to eq(message)
	end

	it "checks encrypt/decrypt long messages with static keys" do
		expect(initialize.decrypt(initialize.encrypt(long_msg))).to eq(long_msg)
	end

	it "checks encrypt/decrypt with random keys" do
		expect(random.decrypt(random.encrypt(message))).to eq(message)
	end

	it "checks encrypt/decrypt long messages with random keys" do
		expect(random.decrypt(random.encrypt(long_msg))).to eq(long_msg)
	end

end

