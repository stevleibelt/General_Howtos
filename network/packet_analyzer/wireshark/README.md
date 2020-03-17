# Filter examples

```
#filter for ip range
# we want to see all packages going to and from ip range 192.168.178.100 up and included to 192.168.178.120
(ip.src >= 192.168.178.100 && ip.src <= 192.168.178.120) || (ip.dst >= 192.168.178.100 && ip.dst <= 192.168.178.120)
```

# Issue fixing

## Windows 10 - no interfaces found

Install Winpcap (`choco install winpcap`) and restart Wireshare as administrator

[Three methods how to fix this issue](https://www.outlookappins.com/windows-10/wireshark-no-interfaces-found/#Method_2_Configure_WinPcap) - 2020-03-02

# Links

* [wireshark tutorial (german)](http://www.nwlab.net/tutorials/wireshark/) - 2020-03-02
