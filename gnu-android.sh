#!/bin/bash

install_path="/sdcard"

while [[ true ]]; do

  clear

  printf "GNU/Android\n"
  printf "Gnu apps for android\n"
  printf "\x1b[33m"
  printf "[READ THIS]\n"
  printf "If you have root on your phone, the installation path can be /sbin, this means that compiled apps can be accessed from recovery, or globally (anywhere), otherwise the install path would be on your sd-card or internal storage(/sdcard)\n"
  printf "RUN THIS ONLY ON TERMUX! DEFAULT ANDROID INSTALLATION ISN'T ENOUGH TO COMPILE ALL APPS\n"
  printf "\x1b[39;49m"
  printf "\x1b[37;44m"
  printf "** Installation **\x1b[39;49m\n"

  printf "[I]nstall path: $install_path\n"

  printf "\nI[n]stall >>\n"

  printf "\x1b[39;49m"
  printf "\x1b[37;44m******************\n"

  printf "\x1b[39;49m"

  read -n1 input

  if [[ "$input" == "i" ]]; then
    printf "\nset install path: "
    read install_path
  fi

  if [[ "$input" == "n" ]]; then
    install_list=("gcc" "g++" "nano" "bash" "cpio" "grep" "gzip" "tar")
    find_path="~/../usr/bin"

    for app in ${install_list[@]}; do
      printf "Upgrading $app\n"
      pkg install $app
      pkg upgrade $app
      printf "Copying $app\n"
      cp $(find $find_path -name $app) $install_path
    done

    printf "\npress any key..."
    read -n1 input
  fi

  if [[ "$input" == "q" ]]; then
    break
  fi
done

printf "\n"
