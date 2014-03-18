function exampleLs()
{
  # "$@" pass all parameters to the command, you can also use "$1" for first parameter etc.
  ls -halt "$@"
}

#example for using parameters and setting default if no one is valid or set
function sshMyHost()
{
  case "$1" in
   "root") USER="root";;
   *) USER="user"
  esac

  ssh $USER@127.0.0.1
}

