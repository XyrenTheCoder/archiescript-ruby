$ascii_letters = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z", "a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", " "]
$digits = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"]

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

def encode(*text)
    arr = []
    text.join(" ").each_char do |i|
        if not ($ascii_letters + $digits).include? i
            text = text.to_a
            return "Invalid character at position #{text.index(i)}"
        end
        if i == " "
            arr.append("*")
        elsif i.isdigit?
            var = "+"*i.to_i + "%~"
            arr.append(var)
        elsif i.isupper?
            i = i.ord.to_i - 64 #0x40
            arr.append("#{'+'*i}@")
        elsif i.islower?
            i = i.ord.to_i - 96 #0x60
            arr.append("#{'+'*i}#")
        end
    end
    arr.append(".;")
    return arr.join
end

def decode(*text)
    value = 0
    arr = []
    out = ''
    text.join(" ").each_char do |i|
        if i == "+"
            value += 1
        elsif i == "."
            out += arr.join
        elsif i == "#"
            arr.append((96+value).chr)
            value = 0
        elsif i == "@"
            arr.append((64+value).chr)
            value = 0
        elsif i == ";"
            break
        elsif i == "*"
            arr.append(" ")
        elsif i == "~"
            value = 0
        elsif i == "%"
            arr.append(value.to_s)
        end
    end
    return arr.join
end

if __FILE__ == $0
    if ARGV[0] == "encode"
        ARGV.shift
        puts "#{encode(*e = ARGV)}"
    elsif ARGV[0] == "decode"
        ARGV.shift
        puts "#{decode(*e = ARGV)}"
    else
        puts "Invalid arguments\nUsage: #{File.basename(__FILE__)} <encode/decode> <string>"
    end
end
