#!/usr/bin/env bash


ip route replace fd00:2::/32 via fd00:1111:2222:3333:4444::2 proto static
ip route replace fd00:3::/32 via fd00:1111:2222:3333:4444::3 proto static
ip route replace fd00:4::/32 via fd00:1111:2222:3333:4444::4 proto static

