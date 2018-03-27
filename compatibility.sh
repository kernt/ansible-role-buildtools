#!/bin/sh

echo "Compatibility"
echo "-------------"
echo ""
echo "This role has been tested against the following distributions and Ansible version:"
echo ""
echo "|distribution|ansible 2.4|ansible 2.5|ansible 2.6|"
echo "|------------|-----------|-----------|-----------|"
cat .travis.yml | docker run -i --rm jlordiales/jyparser get ".env" | while read dash version distro ; do
  echo "${distro}" | cut -d\" -f2 | sort | uniq | while read distribution ; do
  grep "${distribution}" .travis.yml | grep 2.4 > /dev/null && v24=yes || v24=no
  grep "${distribution}" .travis.yml | grep 2.5 > /dev/null && v25=yes || v25=no
  grep "${distribution}" .travis.yml | grep 2.6 > /dev/null && v26=yes || v26=no
  echo "|${distribution}|${v24}|${v25}|${v26}|"
 done
done | sort | uniq
