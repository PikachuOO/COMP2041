#!/bin/bash
for i in *.jpg; do convert "`echo "$i"`" "`echo "$i" | sed s/.jpg/.png/`"; done
