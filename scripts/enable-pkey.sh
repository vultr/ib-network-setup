#!/bin/bash

highKey=`sort -r /sys/class/infiniband/mlx5_0/ports/1/pkeys/* | head -1`
myPKEY=$(printf '0x%04X\n' "$((highKey ^ 0x8000))")

for interface in `(ip -br l | awk '{print $1}' | grep ib)`; do
  ip link set dev $interface up
  echo $myPKEY > /sys/class/net/$interface/create_child
  ip link set dev ${interface}.${myPKEY:2} up
done