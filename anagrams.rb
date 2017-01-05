def first_anagram?(string1, string2)
  letters = string1.split("")
  anagrams = permutations(letters)
  anagrams = anagrams.map { |perm| perm.join("") }
  anagrams.include?(string2)
end

def permutations(array)
  return [array] if array.length <= 1

  first = array.shift
  perms = permutations(array)
  total_perms = []

  perms.each do |perm|
    (0..perm.length).each do |i|
      total_perms << perm[0...i] + [first] + perm[i..-1]
    end
  end

  total_perms
end

def third_anagram?(string1, string2)
  letters1 = string1.split("").sort
  letters2 = string2.split("").sort

  true if letters1 == letters2
end

# p permutations(["g", "i", "z", "m", "o"])
p first_anagram?("gizmo", "sally")    #=> false
p first_anagram?("elvis", "lives")    #=> true

# def subsets(array)
#   i = 0
#   array.take(i) + array[i] + array.drop(i - 1)
# end
