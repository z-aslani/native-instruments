#!/bin/bash

while getopts ":d:c:i:t:b:p:n:r:m:u:" opt; do
  case $opt in
    n) namespace="$OPTARG"
    ;;
    d) deployment="$OPTARG"
    ;;
    c) container="$OPTARG"
    ;;
    i) imagename="$OPTARG"
    ;;
    t) imagetag="$OPTARG"
    ;;
    b) branchname="$OPTARG"
    ;;
    r) imagerepository="$OPTARG"
    ;;
    p) projectname="$OPTARG"
    ;;
    m) commitmessage="$OPTARG"
    ;;
    u) username="$OPTARG"
    ;;
    \?) echo "Invalid option -$OPTARG" >&2
    ;;
  esac
done

if [ "$deployment" == "nginx" ] ; then
        oldversion=$(kubectl -n $namespace get deployment $deployment -o=jsonpath='{$.spec.template.spec.containers[:2].image}' | awk -F"$imagename:" '{print $container}' | awk -F" " '{print $deployment}')
else
        oldversion=$(kubectl -n $namespace get deployment $deployment -o=jsonpath='{$.spec.template.spec.containers[:1].image}' | awk -F":" '{print $container}')
fi

kubectl -n $namespace set image deploy $deployment $container=reg.pegah.tech/$imagerepository/$imagename:$imagetag



