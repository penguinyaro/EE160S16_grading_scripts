#!/bin/csh

# visit each student direactory and do something


#skipping thing
@ skip=0 # @ is short hand for set
@ i=0
echo "Do you want to skip students? (y/n)"
set do_skip = $< #equivalent to read in bash
if ($do_skip == 'y') then
        echo "How many do you want to skip?"
        set skip = $<
endif


foreach s (`/bin/ls`)

        #skipping structure
        if ($i < $skip) then
                echo "skipping $s"
                @ i++
                continue
        endif


        echo "-=Entering: $s=-"

        cd $s # go into student

        echo -n "(s)kip, (o)pen, (q)uit, any other key to test: "
        set op = $<

        if ($op == "s") then
                echo "skipping..."
        else if ($op == "S") then #super skipping
                echo -n "How many more students do you want to skip (not includeing $s)? "
                set skip = $<
                @ i=0
        else if ($op == o) then
                csh #just open a shell
        else if ($op == q) then
                break
        else
                echo "RUNNING TESTS..."
                echo "----"
                echo " "

                #do some tests (e.g. run the program)
                echo "WELCOME PROGRAM:"
                if (-e welcome_err) then
                        echo "ERROR!"
                        cat welcome_err
                else #it does not exist
                        ./welcome
                endif
                echo "-----"
                echo " "

                csh #open the shell after

        endif

        #go back up
        cd ..

        echo "*******************"
        echo " "#lazy way to get new line
        echo " "#lazy way to get new line
end

echo "script all pau"
