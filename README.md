# archiescript-ruby
A custom esolang made by thatOneArchUser, this repository contains encoder and decoder <br>
(*rewritten and modified in ruby by Archisha*)

## How they works?
Encoder and Decoder listen to these commands:

`+` increases the [value](https://github.com/thatOneArchUser/archiescript/blob/main/decoder.py#L5) integer

> `-` decreases the value integer (remains unused, decrement issue)

`#` appends a lowercase letter in the [array](https://github.com/thatOneArchUser/archiescript/blob/main/decoder.py#L10)

`@` appends a uppercase letter in the array

`*` appends space in the array

`~` resets the value (changed from `!` because of bash conflict)

`%` prints the value integer (changed from `&` because of bash conflict)

`.` prints the data stored inside the array

`;` exits

## Usage
`ruby main.rb <encode/decode> <string>`

## credits
original work by [thatOneArchUser](https://github.com/thatOneArchUser/archiescript)
