#!/bin/sh
#clear
echo '==>rm -rf .legit'
rm -rf .legit
echo '==>ls -al'
ls -al

#test init
echo '===========CASE 0==========='
echo '==>./legit.pl init init'
./legit.pl init init
echo '==>rm -rf .legit'
rm -rf .legit
echo '===========CASE 1==========='
echo '==>./legit.pl'
./legit.pl
echo '==>rm -rf .legit'
rm -rf .legit
echo '===========CASE 2==========='
echo '==>./legit.pl -init'
./legit.pl -init
echo '==>rm -rf .legit'
rm -rf .legit
echo '===========CASE 3==========='
echo '==>./legit.pl "init"'
./legit.pl "init"
echo '==>rm -rf .legit'
rm -rf .legit
echo '===========CASE 4==========='
echo '==>./legit.pl init*'
./legit.pl init*
echo '==>rm -rf .legit'
rm -rf .legit
echo '===========CASE 5==========='
echo '==>./legit.pl -init'
./legit.pl -init
echo '==>rm -rf .legit'
rm -rf .legit
echo '===========CASE 6==========='
echo '==>./legit.pl int'
./legit.pl int
echo '==>rm -rf .legit'
rm -rf .legit
echo '===========CASE 7==========='
echo '==>./legit.pl initt'
./legit.pl initt
echo '==>rm -rf .legit'
rm -rf .legit
echo '===========CASE 8==========='
echo '==>./legit.pl ini\t'
./legit.pl ini\t
echo '==>rm -rf .legit'
rm -rf .legit
echo '===========CASE 9==========='
echo '==>./legit.pl init'
./legit.pl init
echo '==>./legit.pl init'
./legit.pl init
echo '==>rm -rf .legit'
rm -rf .legit
echo '===========CASE 10==========='
echo '==>./legit.pl init'
./legit.pl init
echo '===========CASE 11==========='
echo '==>./legit.pl init binit'
./legit.pl init init
echo '==>rm -rf .legit'
rm -rf .legit
echo '===========CASE 12==========='
echo '==>echo "Test 1234" > testfile'
echo "Test 1234" > testfile
echo 'ls -al'
ls -al
echo '==>./legit.pl init'
./legit.pl init
echo '==>rm -rf .legit'
rm -rf .legit
echo '==>rm -f testfile'
rm -f testfile

echo '===========CASE 13==========='
echo '==>echo "Test 1234" > testfile1'
echo "Test 1" > testfile1
echo '==>./legit.pl init'
./legit.pl init
echo '==>./legit.pl add testfile1'
./legit.pl add testfile1
echo '==>rm -rf .legit'
rm -rf .legit
echo '==>rm -f testfile1'
rm -f testfile1

echo '===========CASE 14==========='
echo '==>./legit.pl init'
./legit.pl init
echo '==>echo "Test P" > P'
echo "Test P" > P
echo '==>./legit.pl add .'
./legit.pl add .
echo '==>rm -f P'
rm -f P

echo '===========CASE 15==========='
echo '==>rm -rf .legit'
rm -rf .legit
echo '==>echo "Test Q" > Q'
echo "Test Q" > Q
echo '==>./legit.pl add Q'
./legit.pl add Q
echo '==>rm -f Q'
rm -f Q

echo '===========CASE 16==========='
echo '==>rm -rf .legit'
rm -rf .legit
echo '==>./legit.pl add Q'
./legit.pl add Q
echo '==>rm -f Q'
rm -f Q


echo '===========CASE 17==========='
echo '==>./legit.pl init'
./legit.pl init
echo '==>echo "Test S" > S'
echo "Test S" > S
echo '==>echo "Test T" > T'
echo "Test T" > T
echo '==>./legit.pl add *'
./legit.pl add *

echo '===========CASE 18==========='
echo '==>./legit.pl add '
./legit.pl add
echo '==>./legit.pl add non_existent_file'
./legit.pl add non_existent_file
echo '==>./legit.pl add .non_existent_file'
./legit.pl add .non_existent_file
echo '==>./legit.pl add ///'
./legit.pl add ///

echo '===========CASE 19==========='
echo '==>echo "Test 1234" > testfile2'
echo "Test 2" > testfile2
echo '==>echo "Test 1234" > testfile3'
echo "Test 3" > testfile3
echo '==>./legit.pl add testfile2 testfile3'
./legit.pl add testfile2 testfile3

echo '===========CASE 20==========='
echo '==>echo "Test a" > a'
echo "Test a" > a
echo '==>echo "Test B" > B'
echo "Test B" > B
echo '==>echo "Test 6" > 6'
echo "Test 6" > 6
echo '==>echo "Test aA0" > aA0'
echo "Test aA0" > aA0
echo '==>./legit.pl add a B 6'
./legit.pl add a B 6 aA0

echo '===========CASE 21==========='
echo '==>./legit.pl add .non_existed non_existent'
./legit.pl add .non_existed non_existent
echo '==>./legit.pl add  non_existent .non_existed'
./legit.pl add non_existent .non_existed
echo '==>./legit.pl add  _non_existed'
./legit.pl add _non_existed

echo '===========CASE 22==========='
echo '==>echo "Test a" > a.-_'
echo "Test a.-" > a.-_
echo '==>echo "Test B" > B__'
echo "Test B__" > B__
echo '==>echo "Test 6" > 6--'
echo "Test 6--" > 6--
echo '==>echo "Test aA0" > aA0..'
echo "Test aA0.." > aA0..
echo '==>./legit.pl a.-_ B__ 6-- aA0..'
./legit.pl add a.-_ B__ 6-- aA0..
echo "==>./legit.pl commit -m 'first commit'"
./legit.pl commit -m 'first commit'

echo '===========CASE 23==========='
echo '==>echo "Test a" > another'
echo "Test a.-" > another
echo '==>./legit.pl another'
./legit.pl add another
echo "==>./legit.pl commit -m 'second commit'"
./legit.pl commit -m 'second commit'

echo '===========CASE 24==========='
echo '==>echo "Test a" > another1'
echo "Test a.-" > another1
echo '==>./legit.pl another1'
./legit.pl add another1
echo "==>./legit.pl commit -p 'third commit'"
./legit.pl commit -p 'third commit'

echo '===========CASE 25==========='
echo '==>echo "Test a" > another2'
echo "Test a.-" > another2
echo '==>./legit.pl another2'
./legit.pl add another2
echo "==>./legit.pl commit -m"
./legit.pl commit -m

echo '===========CASE 26==========='
echo '==>echo "Test a" > another3'
echo "Test a.-" > another3
echo '==>./legit.pl another3'
./legit.pl add another3
echo "==>./legit.pl commit -m ''"
./legit.pl commit -m ''

echo '===========CASE 27==========='
echo '==>echo "Test a" > another4'
echo "Test a.-" > another4
echo "==>./legit.pl commit -a -m 'another4 created'"
./legit.pl commit -a -m 'another4 created'

echo '===========CASE 28==========='
echo '==>echo "Test slow down" > another5'
echo "Test slow down" > another5
echo '==>./legit.pl another5'
./legit.pl add another5
echo '==>echo "Test speed" > another5'
echo "Test speed" > another5
echo "==>./legit.pl commit -a -m 'catching the change'"
./legit.pl commit -a -m 'catching the change'

echo '===========CASE 29==========='
echo '==>echo "Test slow down" > another6'
echo "Test slow down" > another6
echo "==>./legit.pl commit -m -a 'reversed -m and -a'"
./legit.pl commit -m -a 'reversed -m and -a'

#echo '===========CASE 30==========='
#echo '==>echo "Test a" > another7'
#echo "Test a.-" > another7
#echo '==>./legit.pl another7'
#./legit.pl add another7
#echo "==>./legit.pl commit -m \" \""
#./legit.pl commit -m " "

#echo '===========CASE 31==========='
#echo "==>./legit.pl commit -m \" \""
#./legit.pl commit -m " "

#echo '===========CASE 32==========='
#echo "==>./legit.pl commit -a -m \" \""
#./legit.pl commit -a -m " "

echo '===========CASE 33==========='
echo "==>./legit.pl commit -a -m \"empty commit\""
./legit.pl commit -a -m "empty commit"



