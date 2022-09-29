$ascii_letters = []
$digits = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"]

for a in 65..90
    $ascii_letters.append(a.chr)
end
for b in 97..122
    $ascii_letters.append(b.chr)
end

class String
    def isupper?
        self == self.upcase
    end

    def islower?
        self == self.downcase
    end
    
    def isdigit?
        $digits.include? self
    end
end

def encode(text)
    arr = []
    text.each_char do |i|
        if not ($ascii_letters + $digits).include? i
            return "Invalid character at position #{text.index(i)}"
        end
        if i == " "
            arr.append("*")
        elsif i.isupper?
            arr.append("#{'+'*((i.ord.to_s(16).to_i - 40).to_s.hex)}@")
        elsif i.islower?
            arr.append("#{'+'*((i.ord.to_s(16).to_i - 60).to_s.hex)}#")
        elsif i.isdigit?
            var = "+"*i.to_i + "&!"
            arr.append(var)
        end
    end
    arr.append(".;")
    return arr.join
end

def decode(text)
    value = 0
    arr = []
    out = ''
    text.each_char do |i|
        if i == "+"
            value += 1
        elsif i == "-"
            value -= 1
        elsif i == "."
            out += arr.join
        elsif i == "#"
            arr.append((60+value).to_s.hex.chr)
            value = 0
        elsif i == "@"
            arr.append((40+value).to_s.hex.chr)
            value = 0
        elsif i == ";"
            break
        elsif i == "*"
            arr.append(" ")
        elsif i == "!"
            value = 0
        elsif i == "&"
            arr.append(value.to_s)
        end
    end
    return arr.join
end

if __FILE__ == $0
    if ARGV[0] == "encode"
        args = ARGV.shift
        puts "#{encode(ARGV[0])}"
    elsif ARGV[0] == "decode"
        args = ARGV.shift
        puts "#{decode(ARGV[0])}"
    else
        puts "Invalid arguments\nUsage: #{File.basename(__FILE__)} <encode/decode> <string>"
    end
end
