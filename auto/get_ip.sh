#!/usr/bin/env 
[ -f ./ext_ip ] && echo > ./ext_ip || touch ./ext_ip
cd terraform/ && terraform output > ../tf_out
cd ..
cat tf_out | sed '/external.*/,/}/!d;//d;s/[",=]//g;/![jenkins\-agent]/,//d' | grep jenkins-agent | sed 's/^[[:space:]]*//' >> ext_ip
cat tf_out | sed '/external.*/,/}/!d;//d;s/[",=]//g;/![jenkins\-master]/,//d' | grep jenkins-master | sed 's/^[[:space:]]*//' >> ext_ip