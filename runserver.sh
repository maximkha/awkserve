
# big brain
touch bkpipe
rm bkpipe
mknod bkpipe p
while true
do
    /usr/bin/nc -l 127.0.0.1 8889 -c -v 0<bkpipe | ./webroutes.awk | tee bkpipe
done