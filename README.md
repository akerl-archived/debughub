**Inactive Project**: GitHub used to generate their SVGs client-side in JS, which let me [reverse-engineer the scoring algorithm](http://blog.akerl.org/2014/12/19/reverse-engineering-github-streaks/). Unfortunately, they now generate the SVG on the backend, so this debugging tool is not really very helpful anymore.

DebugHub
=========

[![MIT Licensed](http://img.shields.io/badge/license-MIT-green.svg?style=flat)](https://tldrlegal.com/license/mit-license)

Debug tool for tracing how GitHub contribution charts are created.

## Usage

To set up the system, run `./setup.sh`.

To pull pages for other users, run `./setup.sh`.

You can modify the javascript files to help diagnose how things are happening

## Installation

```
git clone git://github.com/akerl/debughub
```

## License

The code in this repo is released under the MIT License. See the bundled LICENSE file for details

The actual files hosted on github.com which this accesses are owned by GitHub, Inc., and I make no claim to ownership over them. I believe my usage here is fair use of their content. Hosting files taken from github.com on a public site or for purposes other than education would of course be a violation of their license: I neither recommend nor condone such usage.

