#import os, sys, string

def encode(text)
    arr = []
    for i in text
        if i not in list(string.ascii_letters + string.digits)
            return "Invalid character at position #{text.index(i)}"
        end
        if i == " "
            arr.append("*")
        end
        elsif i.isupper()
            arr.append("#{(int(hex(ord(i)), 16) - int('0x40', 16))*'+'}@")
        elsif i.islower()
            arr.append("#{(int(hex(ord(i)), 16) - int('0x60', 16))*'+'}#")
        elsif i.isdigit
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