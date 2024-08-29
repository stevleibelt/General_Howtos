# TCPDump

## Usage

```bash
#list available devices
tcpdump -D

#captures 42 packages from any device
#   -n  -   disables name resultion
#   -nn -   disables port resultion
tcpdump -i any -c42

#dump package content
tcpdump -i any -c1 -A

#save dump
tcpdump -i any -c42 -w my_dump.pcap

#read dump
tcpdump -r my_dump.pcap

#filter by protocol
tcpdump -i any -c42 -icmp

#filter by host
tcpdump -i any -c42 -nn host 12.34.56.78

#filter by port
tcpdump -i any -c42 -nn port 13

#filter by source ip
tcpdump -i any -c42 -nn src 12.34.56.78

#filter by destination ip
tcpdump -i any -c42 -nn dst 12.34.56.78

#complex filter
tcpdump -i any -c42 -nn "port 80 and (src 192.168.122.98 or src 54.204.39.132)"
```

## Output format

```bash
08:41:13.729687 IP 192.168.64.28.22 > 192.168.64.1.41916: Flags [P.], seq 196:568, ack 1, win 309, options [nop,nop,TS val 117964079 ecr 816509256], length 372
#08:41:13.729687        - timestamp of the received packat per local clock
#IP                     - ipv4 is used
#192.168.64.28.22       - source address
#192.168.64.1.41916     - destication address and port
#Flags
```

## Flags

|| Value || Flag Type || Description ||
| S | SYN | Connection Start |
| F | FIN | Connection Finish |
| P | PUSH | Data push |
| R | RST | Connection reset |
| . | ACK | Acknowledgment |

## Links

* [tcpdump manual pages](http://www.tcpdump.org/manpages/tcpdump.1.html)
* [12 tcpdump commands](http://www.tecmint.com/12-tcpdump-commands-a-network-sniffer-tool/)
* [An introduction to using tcpdump at the Linux command line - 2018-10-10](https://opensource.com/article/18/10/introduction-tcpdump)
