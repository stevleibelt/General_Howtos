# pipe is what unix is all about
# pipe redirects output from programm to programm
# the flow of data is from left to right

cat myFile | more

# show only two newest files

ls -t | head -2

# sort myFile entries

cat myFile | sort

# remove duplicate lines

cat myFile | uniq

# count characters or words

cat myFile | wc [-c -m -l -w]

# combination by printing out the shell you are using
## cut -d : -f 7 -> using ':' as delimiter and output only the seventh field

cat /etc/passwd | grep ^$username: | cut -d : -f 7

# how many different users are curently running processes on your machine
## use awk to geht the first column, sort and the strip down by using uniq. Cound the lines by using 'wc -l' and finally, redirect STDIN by using xargs to substract one line by removing the first user line from ps.

ps aux | awk '{print $1}' | sort | uniq | wc -l | xargs expr -1 +

## examples take from the great book 'think unix by jon lasser'
