# golang-trusty

The prebuilt Go binaries have problems with CGO on trusty: https://github.com/golang/go/issues/43996 . Building it there is also a bit of a pain, as it needs newer GCC and some bootstrap bits https://go-review.googlesource.com/c/go/+/248398/ . This repo just builds it appropriately, so it can be used elsewhere.

I hope that you never need this.
