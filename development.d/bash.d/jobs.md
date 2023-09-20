# start command in the forground

```
my_command 
```

# start command in the background

```
my_command &
```

# dealing with jobs

```
#hit CTRL + Z to move currently active job into the background (paused)
#list available job numbers for this shell session
jobs
#get job PID
jobs -l
#run the job in the background
bg [%<job number>]
#run the job in the forground
fg [%<job number>]
#detach running background processes from the shell (they are not killed when the shell is killed)
disown -h %<job number>
```

# links

* http://bash.cyberciti.biz/guide/Putting_jobs_in_background
* http://www.kossboss.com/linux---move-running-to-process-nohup
