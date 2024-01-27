#!/bin/bash

echo "Enter the directory path where you want to run the script:"
read dir_path

cd $dir_path

echo "Enter your file name like = project_name.o"
read File_name_o
echo "Enter your File name like = project_name.c"
read File_name_c
echo "Enter your file name like = project_name"
read File_name
echo "Enter your file name like = project_name.hex"
read File_name_hex

function compile()
{
    avr-gcc -Os -DF_CPU=16000000UL -mmcu=atmega328p -c -o $File_name_o $File_name_c
    sleep 5
    avr-gcc -mmcu=atmega328p $File_name_o -o $File_name
    sleep 5
    avr-objcopy -O ihex -R .eeprom $File_name $File_name_hex
    sleep 10
    if [ -f $File_name_o ] && [ -f $File_name ] && [ -f $File_name_hex ]; then
        echo "AVR code compiled successfully! Files created: $File_name_o, $File_name, $File_name_hex"
    else
        echo "AVR code not compiled."
    fi
}

function boot()
{
    avrdude -F -V -c arduino -p ATMEGA328P -P /dev/ttyACM0 -b 115200 -U flash:w:$File_name_hex
}

echo "Compile the AVR code? (1 for yes, 2 for no)"
read select

if [ $select == 1 ]; then
    compile
else
    echo "AVR code not compiled."
fi

echo "Boot the AVR code? (1 for yes, 2 for no)"
read select

if [ $select == 1 ]; then
    boot
    echo "AVR code booted successfully!"
else
    echo "AVR code not booted."
fi
