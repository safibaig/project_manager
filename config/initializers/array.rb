class Array
  def estimation_sum
    map(&:estimation).inject(:+) || 0
  end
end