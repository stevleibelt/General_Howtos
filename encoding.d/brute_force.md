# issue

`file` returns a message like "Non-ISO extended-ASCII".

# steps

The solving of this issue is a more written version of:
http://superuser.com/a/732589

```
# create a list with supported encodings
iconv --list | sed 's/\/\/$//' | sort > list_with_supported_encodings.txt
```

```
# iterate over the list of know encodings and try to encode the file with it
LOCAL_SUPPORTED_ENCODING_FILE_PATH='list_with_supported_encodings.txt'
LOCAL_RESULT_FILE_PATH='result.txt'

for LOCAL_ENCODING in `cat $LOCAL_SUPPORTED_ENCODING_FILE_PATH`; do
    printf "$LOCAL_ENCODING  "
    iconv -f $LOCAL_ENCODING -t UTF-8 2016-02-08_UPLOAD_CSV.csv.stev > /dev/null 2>&1 && echo "ok: $LOCAL_ENCODING" || echo "fail: $LOCAL_ENCODING"
# uncomment line below if you want to see the result and put it into the file
#done | tee $LOCAL_RESULT_FILE_PATH
# put the output into the file
done | cat > $LOCAL_RESULT_FILE_PATH
```

```
# filter only the successful tryouts
LOCAL_RESULT_FILE_PATH='result.txt'

cat $LOCAL_RESULT_FILE_PATH | grep 'ok:' > 'only_ok_'$LOCAL_RESULT_FILE_PATH
```

Now comes the hard work, you have to give it a try for each "ok" result in the fitting file.

```
# read the result file with the ok content and create a encoded version of your broken file
LOCAL_BROKEN_FILE_PATH='relative/or/full/qualified/file/name.txt'
LOCAL_RESULT_FILE_PATH='only_ok_result.txt'

# sed -e 's/^\(.*\)\ \ ok\(.*\)/\1/p' means
# remove any kind of content starting with '  ok:' on each line
# assmed a line looks like "S2  ok: WS2", the result will look like "WS2"

for LOCAL_ENCODING in `cat $LOCAL_RESULT_FILE_PATH | grep ok | sed -e 's/^\(.*\)\ \ ok\(.*\)/\1/p' | uniq; do
    LOCAL_CONVERTED_FILE_PATH=$LOCAL_ENCODING'_'$LOCAL_BROKEN_FILE_PATH
    #echo $LOCAL_CONVERTED_FILE_PATH
    iconv -f CP850 -t UTF-8 $LOCAL_BROKEN_FILE_PATH > $LOCAL_CONVERTED_FILE_PATH
done
```
Open each file and check if your fitting special characters are looking good.
"WINDOWS-1258" and "CP850" are good blind guesses here.
