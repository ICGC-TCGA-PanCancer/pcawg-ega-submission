#!/bin/bash

declare -a TYPE=('bam' 'bai' 'gz')
echo |tr '\n' '\t' > bulk_report.txt
echo |tr '\n' '\t' >> bulk_report.txt 
for i in "${TYPE[@]}"
do
    echo "$i"|tr '\n' '\t' >> bulk_report.txt
          # or do whatever with individual element of the array
done
echo >> bulk_report.txt

for f in `cat proposed_project_order.txt` 
do 
    echo $f|tr '\n' '\t' >> bulk_report.txt
    echo |tr '\n' '\t' >> bulk_report.txt 
    for i in "${TYPE[@]}" 
    do 
        N=`less bulk_report_of_files_missed_on_ftp_server/$f.bwa.tsv|awk -F"." '{print $(NF-1)}'|grep "$i"|wc -l`
        echo $N |tr '\n' '\t' >> bulk_report.txt
    done
    echo >> bulk_report.txt
done
