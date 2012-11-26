function exampleLs()
{
  # "$@" pass all parameters to the command, you can also use "$1" for first parameter etc.
  ls -halt "$@"
}
