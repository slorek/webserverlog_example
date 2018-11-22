require 'rspec'
require_relative '../lib/log_parser'

describe LogParser do
  let(:file_path) { 'spec/example.log' }
  subject { described_class.new(file_path) }

  describe "#initialize" do
    context "with no arguments" do
      it "raises an exception" do
        expect(->{ described_class.new }).to raise_error ArgumentError
      end
    end

    context "with wrong argument type" do
      it "raises an exception" do
        expect(->{ described_class.new({}) }).to raise_error ArgumentError
      end
    end

    context "with String argument" do
      it "returns an instance" do
        expect(subject).to be_a described_class
      end
    end
  end

  describe "#most_visits" do
    it "returns an Array, each member consisting of request path and number of visits" do
      expect(subject.most_visits).to be_a Array

      subject.most_visits.each do |path|
        expect(path[0]).to be_a String
        expect(path[1]).to be_a Integer
      end
    end

    it "orders the Array according to most visits" do
      expect(subject.most_visits.first[0]).to eq '/contact'
      expect(subject.most_visits.first[1]).to eq 3
      expect(subject.most_visits.last[0]).to eq '/index'
      expect(subject.most_visits.last[1]).to eq 1
    end
  end

  describe "#most_unique_visits" do
    it "returns an Array, each member consisting of request path and number of visits" do
      expect(subject.most_unique_visits).to be_a Array

      subject.most_unique_visits.each do |path|
        expect(path[0]).to be_a String
        expect(path[1]).to be_a Integer
      end
    end

    it "orders the Array according to most unique visits" do
      expect(subject.most_unique_visits.first[0]).to eq '/about'
      expect(subject.most_unique_visits.first[1]).to eq 2
    end
  end
end
