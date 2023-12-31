#!/usr/bin/env 
[ -f ./ext_ip ] && echo > ./ext_ip || touch ./ext_ip
cd terraform/ && terraform output > ../tf_out
cd ..
cat tf_out | sed '/external.*/,/}/!d;//d;s/[",=]//g;/![gitlab\-runner]/,//d' | grep gitlab-runner | sed 's/^[[:space:]]*//' >> ext_ip
cat tf_out | sed '/external.*/,/}/!d;//d;s/[",=]//g;/![gitlab\-server]/,//d' | grep gitlab-server | sed 's/^[[:space:]]*//' >> ext_ip