# Ch 1, Exercise 2
class Array
  def deeply_empty?
    empty? || all?(&:empty?)
  end

  def all_unique?
    size == uniq.size
  end
end
