#!/bin/bash

bc <<< "obase=2;$1" | grep -o 1 | wc -l
