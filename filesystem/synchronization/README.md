# general

This section contains tools you can use for [file synchronization](https://en.wikipedia.org/wiki/Comparison_of_file_synchronization_software).

File synchronisation is not a backup.

## selection criterias for tools

### must have

* open source
* good documentation
* works on multiple os out of the box
* logging is usefull
* can be started as deamon
* can deal with conflicts
* must support local and network synchronization

### nice to have

* could deal with softlinks
* has mobilephone application available

## test cases

### files

#### 01

* touch file file_a on device device_a
* touch file file_b on device device_b
* echo "a" > device_a:file_a
* synchronize
* expectation
    * device_a as file_a and file_b
    * device_b as file_a and file_b
    * file_a contains "a" on both systems

#### 02

* touch file file_a on device device_a
* touch file file_b on device device_b
* echo "a" > device_a:file_a
* wait a second
* echo "b" > device_b:file_a
* synchronize
* expectation
    * device_a as file_a and file_b
    * device_b as file_a and file_b
    * file_a contains "b" on both systems

#### 03

* touch file file_a on device device_a
* touch file file_b on device device_b
* in the same second
    * echo "a" > device_a:file_a
    * echo "b" > device_b:file_a
* synchronize
* expectation
    * device_a as file_a and file_b
    * device_b as file_a and file_b
    * content of file_a is undefined

### directories

#### 01

* mkdir directory_a on device_a
* touch file file_a in directory_a on device device_a
* synchronize
* expectation
    * device_a as directory_a containing file_a
    * device_b as directory_a containing file_a
