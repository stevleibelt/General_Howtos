# I3 Window Manager

## Error Solving

### Opening other applications

Try to use dmenu.

### i3bar has disappeared when autorander changed profile

```bash
cat >> ~/.config/autorandr/postswitch <<DELIM
# net_bazzline_setup_fix_broken_i3bar
if ! pgrep i3bar > /dev/null;
then
  i3bar
  notify-send "Restarted i3bar"
fi
DELIM
```

## Links

* [Reference Card](http://i3wm.org/docs/userguide.html#_delaying_urgency_hint_reset_on_workspace_change)
