# zstd compression and decompression tool

## Example

```bash
# compress
#   -k: keep inputfile
zstd -z <string: file_name[.*]> -o <string: archive_name.zst>

# decompress
zstd -d <string: archive_name.zst>

# list content
zstd -l
```
