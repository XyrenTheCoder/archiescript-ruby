# archiescript-ruby
A custom esolang made by thatOneArchUser, this repository contains encoder and decoder <br>
(*rewritten in ruby by Archisha*)

## How they works?
Encoder and Decoder listen to these commands:

`+` increases the [value](https://github.com/thatOneArchUser/archiescript/blob/main/decoder.py#L5) integer

`-` decreases the value integer

`#` appends a lowercase letter in the [array](https://github.com/thatOneArchUser/archiescript/blob/main/decoder.py#L10)

`@` appends a uppercase letter in the array

`*` appends space in the array

`!` resets the value

`&` prints the value integer

`.` prints the data stored inside the array

`;` exits

## Usage
`ruby main.rb <encode/decode> <string>`
