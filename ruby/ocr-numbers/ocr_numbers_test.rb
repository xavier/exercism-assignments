require 'minitest/autorun'
require_relative 'ocr'

class OCRTest < MiniTest::Unit::TestCase

  def test_recognize_zero
    text = [
      " _ ",
      "| |",
      "|_|",
    ].join("\n")
    assert_equal "0", OCR.new(text).convert
  end

  def test_recognize_one
    text = [
      "   ",
      "  |",
      "  |",
    ].join("\n")
    assert_equal "1", OCR.new(text).convert
  end

  def test_recognize_two
    text = [
      " _ ",
      " _|",
      "|_ ",
    ].join("\n")
    assert_equal "2", OCR.new(text).convert
  end

  def test_recognize_three
    text = [
      " _ ",
      " _|",
      " _|",
    ].join("\n")
    assert_equal "3", OCR.new(text).convert
  end

  def test_recognize_four
    text = [
      "   ",
      "|_|",
      "  |",
    ].join("\n")
    assert_equal "4", OCR.new(text).convert
  end

  def test_recognize_five
    text = [
      " _ ",
      "|_ ",
      " _|",
    ].join("\n")
    assert_equal "5", OCR.new(text).convert
  end

  def test_recognize_six
    text = [
      " _ ",
      "|_ ",
      "|_|",
    ].join("\n")
    assert_equal "6", OCR.new(text).convert
  end

  def test_recognize_seven
    text = [
      " _ ",
      "  |",
      "  |",
    ].join("\n")
    assert_equal "7", OCR.new(text).convert
  end

  def test_recognize_eight
    text = [
      " _ ",
      "|_|",
      "|_|",
    ].join("\n")
    assert_equal "8", OCR.new(text).convert
  end

  def test_recognize_nine
    text = [
      " _ ",
      "|_|",
      " _|",
    ].join("\n")
    assert_equal "9", OCR.new(text).convert
  end

  def test_identify_garble
    text = [
      "   ",
      "| |",
      "   ",
    ].join("\n")
    assert_equal "?", OCR.new(text).convert
  end

  def test_identify_more_garble
    text = [
      " _ ",
      "| |",
      " _| ",
    ].join("\n")
    assert_equal "?", OCR.new(text).convert
  end

  def test_identify_10
    text = [
      "    _ ",
      "  || |",
      "  ||_|",
    ].join("\n")
    assert_equal "10", OCR.new(text).convert
  end

  def test_identify_110101100
    text = [
      "       _     _        _  _ ",
      "  |  || |  || |  |  || || |",
      "  |  ||_|  ||_|  |  ||_||_|",
    ].join("\n")
    assert_equal "110101100", OCR.new(text).convert
  end

  def test_identify_with_garble
    text = [
      "       _     _           _ ",
      "  |  || |  || |     || || |",
      "  |  | _|  ||_|  |  ||_||_|",
    ].join("\n")
    assert_equal "11?10?1?0", OCR.new(text).convert

  end

  def test_identify_1234567890
    text = [
      "    _  _     _  _  _  _  _  _ ",
      "  | _| _||_||_ |_   ||_||_|| |",
      "  ||_  _|  | _||_|  ||_| _||_|",
    ].join("\n")
    assert_equal "1234567890", OCR.new(text).convert
  end

  def test_identify_123_456_789
    text = [
      "    _  _ ",
      "  | _| _|",
      "  ||_  _|",
      "",
      "    _  _ ",
      "|_||_ |_ ",
      "  | _||_|",
      "",
      " _  _  _ ",
      "  ||_||_|",
      "  ||_| _|",
    ].join("\n")
    assert_equal "123,456,789", OCR.new(text).convert
  end

end
