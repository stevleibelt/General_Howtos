sed -n -e 's/^.*\/my\/endline\ pattern\(.*\)$/\1/p' < source.file | sort | uniq -c > destination.file. sort_and_uniq
