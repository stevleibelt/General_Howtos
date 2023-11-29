# Route

Show or manipulate the IP routing table using `route`.

## Examples

```bash
# List routes with address instead of names
route -n

# Delete a route
route del -net 1.2.3.4 netmask 255.0.0.0 metric 50 dev enp3s0
```
