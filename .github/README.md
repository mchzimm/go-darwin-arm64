"install-go-darwin-arm64.sh" - sets up a new working Golang dev environment built natively for Mac OS 11 "Big Sur" on Apple Metal / Darwin ARM64 platform ("Macbook Air M1" or similar, released  2020-11)

Default paths should work, but edit accordingly as per your need.


"update-go-darwin-arm64.sh" - just updates the previous version.

If paths in installer batch file were modified, don't forget to also update in this one.


TODO:

Consolidate both files and just run update by checking if an existing version for Darwin ARM64 already exists.
