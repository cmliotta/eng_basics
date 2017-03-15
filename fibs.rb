# generates, stores and calculates retained fibonacci sequence numbers

class Fibs
  attr_accessor :generated_fibs

  def generate x
    if is_known_fib? x
      @generated_fibs
    else
      generate_fibs x
    end
  end

  def is_known_fib? num
    !@generated_fibs.nil? && !@generated_fibs[num - 1].nil?
  end

  def all_fibs? seq_array
    (seq_array - @generated_fibs).empty?
  end

  def known_fibs_sum_of_squares
    @generated_fibs ? @generated_fibs.map{ |x| x ** 2 }.reduce(:+) : 0
  end

  private

  def generate_fibs x
    a = 0
    b = 1
    c = nil
    i = 2
    @generated_fibs ||= [0 , 1]
    while i < x do
      c = a
      a = b
      b = a + c
      @generated_fibs.push b
      i += 1
    end
    @generated_fibs
  end
end
