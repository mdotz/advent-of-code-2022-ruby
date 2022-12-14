# Advent of Code 2022, Ruby


## Usage

Install dependencies
`bundle install`

There are two approaches in this repo:
1. Simple scripts - `scripts` directory
2. OOP - `lib` directory

**Running scripts:**

`ruby scripts/dayX-Y.rb path_to_your_input_file`

where `X` is day number and `Y` is part number

**Running OOP code:**

`./bin/dayXpartY path_to_your_input_file`

where `X` is day number and `Y` is part number

## Special cases:

**OOP Day 1, Part 1:**

Run `./bin/day1 path_to_your_input_file`

example:
```
➜ ./bin/day1 day1input.txt
12345
```

**OOP Day1, Part 2:**

Run the same as Part 1 with additional -n argument set to 3, for top 3 bags to sum
example:
```
➜ ./bin/day1 -n 3 day1input.txt
12345
```

## Development

I used gem boilerplate for development, because I'm lazy.

