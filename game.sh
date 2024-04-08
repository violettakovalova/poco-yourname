#!/bin/bash

current_path=$(pwd)
have_weapon=false
have_key=false
cd Start_game

function check_directory {
    


    if [[ $PWD == "${current_path}/Start_game/.find_a_weapon" ]]; then
        echo "You found a weapon! going back with this weapon!"
        cd ${current_path}/Start_game
        have_weapon=true

    fi  

    if [ "$have_weapon" = false ] && [[ $PWD == "${current_path}/Start_game/left/right" ]]; then
        echo "You met a monster without a weapon. You died. Sending you back to the start" 
        cd ${current_path}/Start_game
    elif [ "$have_weapon" = true ] && [[ $PWD == "${current_path}/Start_game/left/right" ]]; then
        echo "You met a monster with a weapon. You fight the monster and You won!!" 
    fi

    if [[ $PWD == "${current_path}/Start_game/right/.search_for_key" ]]; then
        echo "You found a key!"
        have_key=true
    fi  

    if [[ $PWD == "${current_path}/Start_game/left/straight" ]]; then
        echo "You encounter a trap! You are injured. Sending you back to start."
        cd ${current_path}/Start_game
    fi
    if [[ $PWD == "${current_path}/Start_game/straight/straight" ]]; then
        echo "You encounter a trap! You are injured. Sending you back to start."
        cd ${current_path}/Start_game
    fi
    if [[ $PWD == "${current_path}/Start_game/straight/left" ]]; then
        echo "You encounter a trap! You are injured. Sending you back to start."
        cd ${current_path}/Start_game
    fi
    if [[ $PWD == "${current_path}/Start_game/straight/right" ]]; then
        echo "You encounter a trap! You are injured. Sending you back to start."
        cd ${current_path}/Start_game
    fi
    if [ "$have_weapon" = true ] && [ "$have_key" = false ] && [[ $PWD == "${current_path}/Start_game/left/right/door" ]]; then
        echo "You need a key to escape. (Try seaching around)"
    fi

    if [ "$have_weapon" = true ] && [ "$have_key" = true ] && [[ $PWD == "${current_path}/Start_game/left/right/door" ]]; then
        echo "You won! You have escape the dangerous maze."
        cd ${current_path}/Start_game
    fi
}

function custom_cd {
    builtin cd "$@" && check_directory
}

alias cd='custom_cd'