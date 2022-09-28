$ascii_letters = []
$digits = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"]

for a in 65..90
    $ascii_letters.append(a.chr)
end
for b in 97..122
    $ascii_letters.append(b.chr)
end

def isupper?
    self == self.upcase
end

def islower?
    self == self.downcase
end
    
def isdigit?
    $digits.include? self
end

def encode(text)
    arr = []
    text.each_char do |i|
        if ($ascii_letters + $digits).include? i
            return "Invalid character at position #{text.find_index(i)}"
        end
        if i == " "
            arr.append("*")
        elsif i.isupper?
            arr.append("#{(i.ord.to_s(16).to_i - '0x40'.to_i(16))*'+'}@")
        elsif i.islower?
            arr.append("#{(i.ord.to_s(16).to_i - '0x60'.to_i(16))*'+'}#")
        elsif i.isdigit?
            var = "+"*i.to_i + "&!"
            arr.append(var)
        end
    end
    arr.append(".;")
    return ''.join(arr)
end

def decode(text)
    value = 0
    arr = []
    out = str()
    text.each_char do |i|
        if i == "+"
            value += 1
        elsif i == "-"
            value -= 1
        elsif i == "."
            out += ''.join(arr)
        elsif i == "#"
            arr.append((0x60+value).chr)
            value = 0
        elsif i == "@"
            arr.append((0x40+value).chr)
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
    return ''.join(arr)
end

if __FILE__ == $0
    if ARGV[0] == "encode"
        puts "#{encode(ARGV[1])}"
    elif ARGV[0] == "decode"
        puts "#{decode(ARGV[0])}"
    else
        puts "Invalid arguments\nUsage: #{File.basename(__FILE__)} <encode/decode> <string>"
    end
end
