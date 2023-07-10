cabal-force-upper-bounds
========================

What?
-----

This tool parses a .cabal file and returns a set of Cabal constraints
(either as command line flags or cabal.config stanzas) that constrain your
dependencies to the latest major version still allowed your package.

It is a prototype for a feature that feasibly could be part of cabal itself,
see <https://github.com/haskell/cabal/issues/8387>.

Why?
----

This is necessary if your want your CI system to reliably assess PRs that extend
the upper bound, as otherwise cabal may choose a lower version and a passing
CI would be misleading.


How?
----

```
$ cabal-force-upper-bound --help
TODO
```

Generating command line flags from the cabal file:

```
$ cabal-force-upper-bound *.cabal
"--constraint=Cabal-syntax^>=3.10" "--constraint=base^>=4.18" "--constraint=bytestring^>=0.11" "--constraint=containers^>=0.6" "--constraint=optparse-applicative^>=0.18" "--constraint=pretty^>=1.1" "--constraint=text^>=2.0"
```

What else?
----------

This goes well with

 * [`haskell-bounds-bump-action`](https://github.com/nomeata/haskell-bounds-bump-action), auto-bumping dependency ranges
 * [`haskell-plan-bounds`](https://github.com/nomeata/cabal-plan-bounds), Generating dependencies from the actual CI builds

Contact
-------

This action was created by Joachim Breitner <mail@joachim-breitner.de>,
initially, during [MuniHac 2023](https://munihac.de/2023.html).

