require 'rspec'
require_relative '../lib/log_parser'

describe LogParser do
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
      context "where argument is not a valid file path" do
        let(:file_path) { '../test.xyz' }

        it "raises an exception" do
          expect(->{ described_class.new(file_path) }).to raise_error Errno::ENOENT
        end
      end

      context "where argument is a valid file path" do
        let(:file_path) { 'webserver.log' }

        it "returns an instance" do
          expect(described_class.new(file_path)).to be_a described_class
        end
      end
    end
  end
end
