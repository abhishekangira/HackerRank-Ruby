# Fails testcase 5: 
#   Input: 
#     aaaabababbaabaaabababbababaabaababaababaabaababaaa
#     3
#   Output:
#     5
# => Program's Output : 7

def split string
  indices = (0...string.length).to_a
  return indices.product(indices).reject{|i,j| i > j}.map{|i,j| string[i..j]}
end

def hash array
  h = Hash.new(0)
  array.each do |e|
    h[e]+=1
  end
  return h
end

def islands hash, text
  island_array = []
  hash.each do |x,y|
    i = 0
    j = 0
    k = 0
    idx = []
    up = x.length - 1
    (text.length - up).times{
        if x == text[i..i+up]
            idx[k] = i
  
            if x.length != 1 && k != 0 && (idx[k] - idx[k - 1]) < x.length
                idx.pop
                k-=1
            end
            k+=1
           
        end
         
      i+=1 
    }
    ilen = idx.length
    if ilen == 1
        island_array.push(1)
    else
      i = 0
      count = 1
      
      (ilen - 1).times{
          if idx[i+1] - idx[i] != x.length
              count+=1
          end
          
          i+=1
      }
      island_array.push(count)
    end
    
    j+=1
    
  end
  return island_array
end

def compare h, n
    answer = 0
    h.each do |k,v|
        if k == n
            flag = 1
            answer = v
        end
    end
    return answer
end

text = gets.chomp
n = gets.chomp.to_i
arr = split text
freq = hash arr
islands_array = islands freq,text
islands_hash = hash islands_array
result = compare islands_hash, n
puts result
puts 'hello'
