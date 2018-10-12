#!/usr/bin/env bash

#NOTE:	1. shuffle_test.sh is not designed to handle more than 10 numbers in the range 0 to 9
#	2. bash is used instead of shell because shell doesn't have array functionality

# Looks for a folder test and within it for folders in the format "z[0-9]{7}" and executes the file shuffle.pl (requires prior execution permission) and generates a file called report.txt(previous report.txt files will be deleted) for that particular roll number.

#Evaluation criteria
# Runs the shuffle.pl file 1000 times and records the output. Counts for omissions, repetitions or incorrect values. Selects 4 random values and checks for their occurrence. In an iteration of 1000 each value should occur at roughly (1/10)*1000 positions. Hence a raw entropy range of 60 to 140 inclusive. 

#Writes an exit status of 0 depending on following criterias being met or else exit status 1
# 1. No repetitions or omissions
# 2. No incorrect values
# 3. Occurences within specified range


max_iter=1000
high=10
low=0
entropy_start=59
entropy_end=141
choice1=$(expr $RANDOM % 10)
choice2=$(expr $RANDOM % 10)
choice3=$(expr $RANDOM % 10)
choice4=$(expr $RANDOM % 10)

for dir in test/*;
do
	echo "$dir"
	if echo "$dir" | grep -q "[z][0-9]\{7\}";
	then
		test_file='/shuffle.pl'
		file="$dir$test_file"
		numbers='numbers.txt'
		#echo $i
		#cd $dir
		if [ -e $dir/report.txt ];
		then
			#echo "File Exists"
			#echo $PWD
			mv $dir/report.txt ~/.local/share/Trash
			#exit 1
		fi
		#cd ..
		#cd ..
		#echo $PWD
		#exit 0
		for i in `seq 1 $max_iter`
		do
			result=$(echo "`./$file < $numbers`")
			echo "$result" >> "$dir/report.txt"
			#echo "===" >> "$dir/report.txt"
			
		done
		count[0]=0
		count[1]=0
		count[2]=0
		count[3]=0
		count[4]=0
		count[5]=0
		count[6]=0
		count[7]=0
		count[8]=0
		count[9]=0
		counter=0
		var1=0
		var2=0
		var3=0
		var4=0
		tester=0
		sol_incorrect=0
		while IFS='' read -r line || [[ -n "$line" ]];
		do
			#echo "counitng a, $line"
			if echo "$line" | egrep -q "[0-9]+";
			then
				#echo "counting b"
				if [ $line -lt $high -a $line -ge $low ];
				then
					pos=$(expr $counter % $high)

					if [ $pos -eq $choice1 ];
					then
						if [ $line -eq $choice1 ];
						then
							var1=$(expr $var1 + 1)
						fi
					fi					
					if [ $pos -eq $choice2 ];
					then
						if [ $line -eq $choice2 ];
						then
							var2=$(expr $var2 + 1)
						fi
					fi					
					if [ $pos -eq $choice3 ];
					then
						if [ $line -eq $choice4 ];
						then
							var4=$(expr $var4 + 1)
						fi
					fi					
					if [ $pos -eq $choice4 ];
					then
						if [ $line -eq $choice3 ];
						then
							var3=$(expr $var3 + 1)
						fi
					fi
					counter=$(expr $counter + 1)
					#echo $line
					#echo ${count[$line]}
					count[$line]=$(expr ${count[$line]} + 1)
				else
					echo "Incorrect Value in set" > "$dir/report.txt"
					$sol_incorrect=1
					break
				fi
			else
				echo "Incorrect Value in set" > "$dir/report.txt"
				echo "Exit Status: 1" > "$dir/report.txt"
				$sol_incorrect=1
				break
			fi
			if [ $sol_incorrect -eq 0 -a $pos -eq 10 ];
			then
				for t in "${count[@]}"
				do
					if [ $t -ne $tester ];
					then
						echo "Incorrect Count in set\nThere is repetition or omission in the list" > "$dir/report.txt"
						echo "Exit Status: 1" > "$dir/report.txt"
						$sol_incorrect=1
						break
					fi
				done
			fi
			if [ $sol_incorrect -eq 1 ];
			then
				break
			fi
		done < "$dir/report.txt"
		if [ $sol_incorrect -ne 1 ];
		then
			echo "No repetition or omissions found. All values within paramenter." > "$dir/report.txt"
			echo "$choice1 on position $choice1 has raw entropy $var1" >> "$dir/report.txt"
			if [ $var1 -gt $entropy_start -a $var1 -lt $entropy_end ];
			then
				echo "Everything looks good." >> "$dir/report.txt"
				#echo "$tester" >> "$dir/report.txt"
			else
				echo "Raw entropy out of range." >> "$dir/report.txt"
				sol_incorrect=1
			fi
			echo "$choice2 on position $choice2 has raw entropy $var2\n" >> "$dir/report.txt"
			if [ $var2 -gt $entropy_start -a $var2 -lt $entropy_end ];
                        then
                                echo "Everything looks good." >> "$dir/report.txt"
                                #echo "$tester" >> "$dir/report.txt"
                        else
                                echo "Raw entropy out of range." >> "$dir/report.txt" 
				sol_incorrect=1
			fi
			echo "$choice4 on position $choice3 has raw entropy $var3\n" >> "$dir/report.txt"
			if [ $var3 -gt $entropy_start -a $var3 -lt $entropy_end ];
                        then
                                echo "Everything looks good." >> "$dir/report.txt"
                                #echo "$tester" >> "$dir/report.txt"
                        else
                                echo "Raw entropy out of range." >> "$dir/report.txt"
				sol_incorrect=1
			fi
			echo "$choice3 on position $choice4 has raw entropy $var4\n" >> "$dir/report.txt"
			if [ $var4 -gt $entropy_start -a $var4 -lt $entropy_end ];
                        then
                                echo "Everything looks good." >> "$dir/report.txt"
                                #echo "$tester" >> "$dir/report.txt"
			else
                                echo "Raw entropy out of range." >> "$dir/report.txt"
				sol_incorrect=1
			fi
			if [ $sol_incorrect -eq 1 ];
			then
				echo "Exit Status: 1" >> "$dir/report.txt"
			else
				echo "Exit Status: 0" >> "$dir/report.txt"
			fi
		fi
	fi
done
