## check_server.sh
## Check all upstream servers to PROD


SUPPORT_DATA=~/support/data
SUPPORT_CFG=~/support/cfg

>$SUPPORT_DATA/server_files.txt
>$SUPPORT_DATA/server_files.csv


f=""
while read a b c
        do
        m=`echo $c|grep -c '|'`
        if [[ $m -ge 1 ]]
        then
                f1=`echo $c|sed 's/|/;ls -lrt;cd /g'`
        else
                f1=`echo $c`
        fi



        echo "cd $f1;ls -lrt $f"|ssh $a@$b >> $SUPPORT_DATA/server_files.txt 2>/dev/null

done < $SUPPORT_CFG/server_loc.cfg

#
# Formatting the outout for geneos
#

grep '^\-r' $SUPPORT_DATA/server_files.txt  > $SUPPORT_DATA/server_files.lst

#tr '\t' ',' < /tmp/out.lst > /tmp/out.csv

echo "SNo,Size(Bytes),Month,Date,Time(Multiple Zones),FileName" > $SUPPORT_DATA/server_files.csv

awk '{print NR","$(NF-4)","$(NF-3)","$(NF-2)","$(NF-1)","$NF}' $SUPPORT_DATA/server_files.lst >> $SUPPORT_DATA/server_files.csv

cat $SUPPORT_DATA/server_files.csv
