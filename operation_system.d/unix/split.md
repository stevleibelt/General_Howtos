# split

## split file into chunks of 3 mb

    split -b 3MiB my.file.gz [my.file.gz_]  #[my.file.gz_] is optional
    #line above will result into following files (if the size of the original file is 10 MiB
    my.file.gz_aa
    my.file.gz_ab
    my.file.gz_ac
    my.file.gz_ad
