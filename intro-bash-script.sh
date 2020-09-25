#============ LINUX BASH INTRO ====================
#description: quick intro to linux bash commands
#author: Jorge L Vazquez
#date: 9/23/2020

#--------- navigating files system ---------
mkdir Documents Pictures    #making 2 directories
# navigating filesystem
cd Documents    #change dir using relative apth
pwd             #print working dir
cd              #cd back into home dir
cd /home/jsmith/Pictures    #cd into test using absolute path
                        #use tab completion for spee
#tab twice will show you list of available dir/files
pwd
cd ..           #cd up one directory . means current
pwd
cd ~/Documents  #cd into document dir using tilde expansion
pwd
cd ../../../etc  #cd into /etc directory
pwd

#-------- getting help -----------------------
help            #list of available commands
ls --help       #help for especific command
man ls          #print manual page for command

#---------working with files and folders-------
mkdir test      #make text directory
cd test
pwd
mkdir dir1 dir2 dir3    #create 3 directory
ls              #list content current dir
mkdir dir{4,5,6} #creating files using brace expansion
ls -l               #list content long format
touch dir{1..3}/file{1..3}
ls -Rl              #listing content recursively
touch file1.txt     #creating a single file
echo "hello world"  #standard output
echo "hello world" > output1     #output redirection file1
cat output1
echo "learn bash" > output2      
cat output1 output2 > output3 #redirect multiple files
cat output3
less output3

#-------- working efficient in bash --------------
history         #print previous executed commands
!number         #executes previously typed command
!!              #previously typed command with sudo
up/down arrow   #navigating previouly typed commands
ctr+l           #clear screen
tab completion  #faster typing
double tab      #print available dir/file optons


#------- moving and copying files ---------------
cd test && rm -rf *
mkdir dir{1..3} && touch dir{1..3}/file{1..3}
cd test && mkdir ~/test2     #cd into test and create ~/test2
mv dir1/file1 ~/test2/       #move file1 into test2
ls ~/test2                   #list content of test2
cp dir2/file2 ~/test2/       #copy dir2/file2 test2
ls ~/test2
cp dir3 ~/test2              #copy dir3 test2
mv dir2 ~/test2              #move dir2 test2
ls ~/test2
mv dir1/* test2              #move content of dir1 to test2
ls ~/test2
mv dir1/file2 dir/renamed   #renaming files
ls -l dir1                  #list dir1 content
rm dir1
rm -rf dir1                 #removing a directory
rm -rf dir{2,3}             #removing dir2 and 3
ls 
cd ..
rm -rf test                 #remove test dir

#---------- manipulating command line output ----------
ls 
ls -l > ls_output
cat ls_output
cat ls_output | grep Pictures
#finding ssh processes
ps aux | grep ssh | grep ^jsmith
#getting ipv4 address
ip a 
ip a | grep inet | grep enp0s3 | cut -d' ' -f6 | cut -d/ -f1
#getting users shell
cat /etc/passwd
cat /etc/passwd | cut -d: -f1,7 > users_shell
#finding users using bash
grep "/bin/bash" /etc/passwd