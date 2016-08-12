class String
  def plurialize
    if self[-1] == 'y'
      self[0..-2] + "ies"
    else
      self + "s"
    end
  end
end
