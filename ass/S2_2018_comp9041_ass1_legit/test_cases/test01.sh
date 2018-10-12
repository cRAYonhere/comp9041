#!/bin/sh


#clear
echo '==>rm -rf .legit'
rm -rf .legit
echo '==>ls -al'
ls -al

#testing log
echo '===========CASE 34==========='
echo '==>./legit.pl log'
./legit.pl log

echo '===========CASE 35==========='
echo '==>./legit.pl init'
./legit.pl init
echo '==>./legit.pl log'
./legit.pl log

echo '===========CASE 36==========='
echo '==>./legit.pl init'
./legit.pl init
echo "Test 1" > testfile1
echo "Test 2" > testfile2
echo '==>./legit.pl add *'
./legit.pl add * 
echo '==>./legit.pl log'
./legit.pl log

echo '===========CASE 37==========='
echo '==>./legit.pl init'
./legit.pl init
echo '==>echo "Test 1" > testfile1'
echo "Test 1" > testfile1
echo '==>echo "Test 2" > testfile2'
echo "Test 2" > testfile2
echo '==>./legit.pl add *'
./legit.pl add * 
echo '==>./legit.pl commit -m "first commit"'
./legit.pl commit -m "first commit"
echo '==>./legit.pl log'
./legit.pl log

echo '===========CASE 38==========='
echo '==>./legit.pl log apple'
./legit.pl log apple

echo '===========CASE 39==========='
echo '==>./legit.pl log " "'
./legit.pl log " "

echo '===========CASE 40==========='
echo '==>./legit.pl init'
./legit.pl init
echo '==>echo "Test 3" > testfile3'
echo "Test 3" > testfile3
echo '==>echo "testfile 1 is changed" > testfile1'
echo "testfile 1 is changed" > testfile1
echo '==>./legit.pl add testfile3'
./legit.pl add testfile3
echo '==>./legit.pl commit -a -m "second commit"'
./legit.pl commit -a -m "second commit"
echo '==>./legit.pl log'
./legit.pl log

#testing show
echo '===========CASE 41==========='
echo '==>./legit.pl show :testfile1'
./legit.pl show :testfile1

echo '===========CASE 42==========='
echo '==>echo "Test 4" > testfile4'
echo "Test 4" > testfile4
echo '==>echo "Test 5" > testfile5'
echo "Test 5" > testfile5
echo '==>./legit.pl add testfile4 testfile5'
./legit.pl add testfile4 testfile5
echo '==>./legit.pl show :non_existed_file'
./legit.pl show :non_existed_file

echo '===========CASE 43==========='
echo '==>echo "file not added" > not_added'
echo "file not added" > not_added
echo '==>./legit.pl show :not_added'
./legit.pl show :not_added

echo '===========CASE 44==========='
echo '==>./legit.pl show :testfile5'
./legit.pl show :testfile5

echo '===========CASE 45==========='
echo '==>./legit.pl show 0:testfile5'
./legit.pl show 0:testfile5

echo '===========CASE 46==========='
echo '==>./legit.pl show 0:testfile4'
./legit.pl show 0:testfile4

echo '===========CASE 47==========='
echo '==>./legit.pl show 1:testfile1'
./legit.pl show 1:testfile1

echo '===========CASE 48==========='
echo '==>./legit.pl show 0:testfile1'
./legit.pl show 0:testfile1

echo '===========CASE 49==========='
echo '==>./legit.pl show 3:testfile5'
./legit.pl show 3:testfile5

echo '===========CASE 50==========='
echo '==>./legit.pl show :'
./legit.pl show :

echo '===========CASE 51==========='
echo '==>./legit.pl show sing:song'
./legit.pl show sing:song

