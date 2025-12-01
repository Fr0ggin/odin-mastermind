# odin-mastermind
Assignment: Build a Mastermind game from the command line where you have 12 turns to guess the secret code, starting with you guessing the computer’s random code.

<!-- 
PSEUDOCODE

Mastermind colors
0 -> red
1 -> yellow
2 -> green
3 -> blue
4 -> black 
5 -> white

Class Players
    initialize
    # wins
    # losses
    # solver
    # code_creator

Class Code
    create_code
    create random number (between 0-1) and * 5555 (round up)


Class Board
    show_code
    show_code_as_colors
    parse the guess
        check if right
            if no
                return the red and white pins (how good is the guess)
    count turns

Class Game
    create_code
        -> debug show code for easier debug
    guess

Class Play
    create player
    create computer
    loop do
        (later on ask create, or crack)
        game
        update score
        restart?
 -->