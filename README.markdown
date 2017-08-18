# Sbcl-Compat

sbcl-compat is a workaround library for using SBCL dependent libraries on other CL implementations.

Now just made local-nicknames option of defpackage available on allegro CL.

Of course quicklisp not yet......

## Installation

Ideally it would become

```common-lisp
(defsystem YOUR-SYSTEM
  :depends-on (#-sbcl :sbcl-compat
	       OTHER-LIBRARIES )  ... )
```	       			  

## Author

* Shaka Chen (scchen@libgirl.com)

## Copyright

Copyright (c) 2017 Shaka Chen (scchen@libgirl.com)

## License

Licensed under the LLGPL License.
