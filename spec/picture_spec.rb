require 'spec_helper'
require_relative '../picture'

describe Picture do
  before do
    @picture = Picture.new(20,10)
  end

  describe '#stadistics' do
    it 'has correct statistics' do
      expect(@picture.paint(1,5,5,10,3).paint(2,0,0,7,7).stadistics).to eql(
        [[0, 125], [1, 26], [2, 49]]
      )
    end
  end

  describe '#print_canvas' do
    it 'prints a picture representation' do
      expect { @picture.paint(1,5,5,10,3).print_canvas }.to output(
        "0 0 0 0 0 0 0 0 0 0\n0 0 0 0 0 0 0 0 0 0\n0 0 0 0 0 0 0 0 0 0\n0 0 0 0 0 0 0 0 0 0\n0 0 0 0 0 0 0 0 0 0\n0 0 0 0 0 1 1 1 0 0\n0 0 0 0 0 1 1 1 0 0\n0 0 0 0 0 1 1 1 0 0\n0 0 0 0 0 1 1 1 0 0\n0 0 0 0 0 1 1 1 0 0\n0 0 0 0 0 1 1 1 0 0\n0 0 0 0 0 1 1 1 0 0\n0 0 0 0 0 1 1 1 0 0\n0 0 0 0 0 1 1 1 0 0\n0 0 0 0 0 1 1 1 0 0\n0 0 0 0 0 0 0 0 0 0\n0 0 0 0 0 0 0 0 0 0\n0 0 0 0 0 0 0 0 0 0\n0 0 0 0 0 0 0 0 0 0\n0 0 0 0 0 0 0 0 0 0\n"
      ).to_stdout
    end
  end
end

describe Picture::FromCSV do
  describe '#new' do
    it 'prints formatted stadistics' do
      fixture_file = File.expand_path("../fixtures/input.csv", __FILE__)

      expect { Picture::FromCSV.new(fixture_file) }.to output(
        "0 9694\n1 36\n5 270\n"
      ).to_stdout
    end
  end
end
