#import os, sys, string

ascii_letters = []
digits = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"]

for a in (65..91)
    ascii_letters.append(a.chr)
end
for b in (97..123)
    ascii_letters.append(b.chr)
end

class String
    def isupper?
        self == self.upcase
    end

    def islower?
        self == self.downcase
    end
    
    def isdigit?
        if self in digits
            return true
        else
            return false
        end
    end
end

def encode(text)
    arr = []
    for i in text
        if i not in ascii_letters + digits
            return "Invalid character at position #{text.find_index(i)}"
        end
        if i == " "
            arr.append("*")
        end
        elsif i.isupper?
            arr.append("#{(i.ord.to_s(16).to_i - int('0x40', 16))*'+'}@")
        elsif i.islower?
            arr.append("#{(i.ord.to_s(16).to_i - int('0x60', 16))*'+'}#")
        elsif i.isdigit?
            var = "+"*int(i) + "&!"
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
    for i in text
        if i == "+"
            value += 1
        elsif i == "-"
            value -= 1
        elsif i == "."
            out += ''.join(arr)
        elsif i == "#"
            arr.append(chr(0x60+value))
            value = 0
        elsif i == "@"
            arr.append(chr(0x40+value))
            value = 0
        elsif i == ";"
            break
        elsif i == "*"
            arr.append(" ")
        elsif i == "!"
            value = 0
        elsif i == "&"
            arr.append(str(value))
        end
    end
    return ''.join(arr)
end

if __name__ == "__main__":
    if ARGV[0] == "encode"
        puts "#{encode(ARGV[1])}"
    elif ARGV[0] == "decode"
        puts "#{decode(ARGV[0])}"
    else
        puts "Invalid arguments\nUsage: #{File.basename(__FILE__} <encode/decode> <string>"
    end
end
