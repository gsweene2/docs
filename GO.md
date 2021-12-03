# Go

<!-- toc -->

# Installation

[Documentation](https://golang.org/doc/install)

### Install Notes

"Download Go for Mac" installer completed full installation after clicking through.

## Upgrade Version

1. Uninstall
    ```
    # Confirm location of go (existing is `/usr/local/go/bin/go`)
    which go
    # Remove go installation
    sudo rm -rf /usr/local/go
    ```
2. Download new version from [Go Docs](https://golang.org/doc/install)

# Build, Test, & Run

[Compile and install the application](https://golang.org/doc/tutorial/compile-install)

## Build

```
go build
```

```
go test
```

Example Output:
```
PASS
ok      github.com/org/project       5.728s
```
