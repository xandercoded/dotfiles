#!/usr/bin/env bash

# workaround for passing arguments to functions inside powerline
date $([ -e $1 ] && echo '-u') '+%D %T %z'
