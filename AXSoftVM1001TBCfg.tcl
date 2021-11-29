# This file contain all information related to test bed, like all links between DUTs, access information, etc
set TFTP_DIR "/tftpboot"
set SCP_USER "automation"
set SCP_PWD "a10Password"
set MGMT 10.12.1.157
set TFTP_SERVER_IP $MGMT
set MGMT_GW_IP 10.12.1.1
set MOUNT_ROOT "/mnt/ax-build"
set TERM_SRV 10.12.1.105
set AX1 10.12.1.152
set AX2 10.12.1.153
set RTR1 10.12.1.151
set CLI1 10.12.1.154
set SRV1 10.12.1.155
set AX1_TERM_PORT 12341
set AX2_TERM_PORT 12342
set RTR1_TERM_PORT 12343
# cs_server_ip port_num user_name password enable_password management_ip 
set DUT_ACCESS_INFO(1) [list $TERM_SRV $AX1_TERM_PORT "admin" "a10" "" $AX1 "ax"]
set DUT_ACCESS_INFO(101) [list $TERM_SRV $AX1_TERM_PORT "slb_test" "a10" "" $AX1 "partition"]
set DUT_ACCESS_INFO(2) [list $TERM_SRV $AX2_TERM_PORT "admin" "a10" "" $AX2 "ax"]
#Fundry switch/router 
set DUT_ACCESS_INFO(5) [list $TERM_SRV $RTR1_TERM_PORT "admin" "a10" "" $RTR1 "ax"]
set GEN_ACCESS_INFO(1) $CLI1
set GEN_ACCESS_INFO(2) $SRV1
set DUT_ACCESS_INFO(10) [list $CLI1 "" "root" "password" "" $CLI1 "Linux"]
set DUT_ACCESS_INFO(11) [list $SRV1 "" "root" "password" "" $SRV1 "Linux"]
set REMOTE_ACCESS_INFO(r10) [list $CLI1 "" "root" "password" "" $CLI1 ssh]
set REMOTE_ACCESS_INFO(r11) [list $SRV1 "" "root" "password" "" $SRV1 ssh]
set REMOTE_ACCESS_INFO(r1) [list $AX1 "" "admin" "a10" "" $AX1 ssh]
set REMOTE_ACCESS_INFO(r2) [list $AX2 "" "admin" "a10" "" $AX2 ssh]
# test bed related system variable
set STOP_BY_CRASH 0
set CLEAN_HOSTS 1
set TMP_KEEP_CONFIG_ITEM_LIST [list "system promiscuous-mode" "no debug packet"]
# link between duts and third party router and switch, any number less than 10 will be dut, greater than 10 would be third partys device, like router and switch
# Local AX machine/Remote AX machine/Link name/"Local physical port"
#Terminology: set LINK_CONNECTION("Device","Destination Device","Link Name") "Local Eth Port"
set LINK_CONNECTION(1,2,1) "5"
set LINK_CONNECTION(1,2,2) "6"
set LINK_CONNECTION(1,2,3) "0"
set LINK_CONNECTION(1,2,4) "0"
set LINK_CONNECTION(1,5,r1) "1"
set LINK_CONNECTION(1,5,r2) "1"
set LINK_CONNECTION(1,5,s1) "2"
set LINK_CONNECTION(1,5,s2) "2"
set LINK_CONNECTION(2,1,1) "5"
set LINK_CONNECTION(2,1,2) "6"
set LINK_CONNECTION(2,1,3) "0"
set LINK_CONNECTION(2,1,4) "0"
set LINK_CONNECTION(2,5,r1) "1"
set LINK_CONNECTION(2,5,r2) "1"
set LINK_CONNECTION(2,5,s1) "2"
set LINK_CONNECTION(2,5,s2) "2"
set LINK_CONNECTION(10,5,r1) "eth1"
set LINK_CONNECTION(10,5,r2) "eth2"
set LINK_CONNECTION(11,5,s1) "eth1"  
set LINK_CONNECTION(11,5,s2) "eth2" 
set LINK_CONNECTION(5,1,r1) "3"
set LINK_CONNECTION(5,1,r2) "3"
set LINK_CONNECTION(5,1,s1) "4"
set LINK_CONNECTION(5,1,s2) "4"
set LINK_CONNECTION(5,2,r1) "6"
set LINK_CONNECTION(5,2,r2) "6"
set LINK_CONNECTION(5,2,s1) "7"
set LINK_CONNECTION(5,2,s2) "7"
set LINK_CONNECTION(5,10,r1) "1"
set LINK_CONNECTION(5,10,r2) "1"
set LINK_CONNECTION(5,11,s1) "2"
set LINK_CONNECTION(5,11,s2) "2" 
#Not relevant
set LINK_CONNECTION(5,gen1,r1) "1"
set LINK_CONNECTION(5,gen1,r2) "2"
set LINK_CONNECTION(5,gen2,s1) "3"
set LINK_CONNECTION(5,gen2,s2) "4"
set LINK_CONNECTION(5,man,1) "20"
set LINK_CONNECTION(gen1,5,r1) "eth1"
set LINK_CONNECTION(gen1,5,r2) "eth2"
set LINK_CONNECTION(gen2,5,s1) "eth1"
set LINK_CONNECTION(gen2,5,s2) "eth2"
set LINK_CONNECTION(gen1,5,lp1) "lo"
set LINK_CONNECTION(gen2,5,lp1) "lo"
#-----Begin testbed integration-----#
set testBed(LEGACY)             "0"                     ;# For Unified: 0 Standard testbed 1 (or undefined) Legacy testbed
set testBed(SDN) "0"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  	;# SDN mode
set testBed(DSR) "Off"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  	;# DSR mode: Off, On, L3 (L3 requires srv_side_rtr to be "Yes")
set testBed(RBA) "Off"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  	;# RBA mode: Off, On, L3V
set testBed(Interface) "Physical"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  	;# Interface type: Physical, Virtual
set testBed(Topology) "Routed"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  	;# Topology: Routed, Transparent
set testBed(srv_side_rtr) "No"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  	;# Server side router present: No, Yes
set testBed(mgmtIP) $MGMT				;# IP address of management server	
set testBed(dirList) ""					;# Directories that will be search for tests by GUI
lappend testBed(dirList) "/Unified_SLB/scripts/"
set testBed(mgmt_tftp_dir) "/tftpboot/"
#--- Client Variables ---#
set testBed(cliID)		"10"			;# Client DUT ID
set testBed(cliIP)		"$CLI1"			;# Client IP address
set testBed(cliPrompt)		")#"			;# Client Prompt
set testBed(cliPassword)        [lindex $DUT_ACCESS_INFO($testBed(cliID)) 3] ;# Client password
set testBed(cliInt)		"eth1"			;# Client test interface
set testBed(host_cli_IPv4)	"10.10."		;# Client IPv4 base network. /16 
set testBed(host_cli_IPv6)	"a00a::"		;# Client IPv6 base network. /64
#--- Server Variables ---#
set testBed(srvID)		"11"			;# Server DUT ID
set testBed(srvIP)		"$SRV1"			;# Server IP address
set testBed(srvPrompt)		")#"			;# Server Prompt
set testBed(srvPassword)        [lindex $DUT_ACCESS_INFO($testBed(srvID)) 3] ;# Server password
set testBed(srvInt)		"eth1"			;# Server test interface
set testBed(host_srv_IPv4)	"20.20."			;# Server IPv4 base network. /16
set testBed(host_srv_IPv6)	"b00b::"		;# Server IPv6 base network. /64
# For each service, the first port number MUST be the wellknown port for that service
set testBed(srv_port.httpd)	[list 80 8001 8080 8081]	;# List of ports httpd is listening on
set testBed(srv_port.named)	[list 53 953 5353 6250]	;# List of ports named is listening on
set testBed(srv_port.sshd)	[list 22 6200 8800]	;# List of ports named is listening on
set testBed(srv_tftp_dir)	"/tftpboot"		;# Location of tftp server directory on server
set testBed(srv_named_dir)	"/var/named"		;# Location of named zone directory on server
set testBed(srv_named_custom_file)	"unified.custom.com"	;# Customizable named file. All scripts may overwrite. DO NOT CHANGE WITHOUT CHANGING /etc/named.conf
#--- AX Variables ---#
set testBed(axID)		1			;# AX DUT ID
set testBed(axIP)		$AX1			;# Management IP address of AX
set testBed(rbaID)		101			;# AX Partition DUT ID
set testBed(dutID)		$testBed(axID)		;# Current DUT ID (May change between AX and AX partition)
set testBed(topo_ax_int_cli)	"1"			;# AX client side interface, not used in DSR mode
set testBed(topo_ax_int_srv)	"2"			;# AX server side interface
#Client side
set testBed(ax_cli_IPv4)	"10.10."		;# AX client side IPv4 network
set testBed(ax_cli_IPv6)	"a00a::"		;# AX client side IPv6 network
#Server side
set testBed(ax_srv_IPv4)	"20.20."		;# AX server side IPv4 network
set testBed(ax_srv_IPv6)	"b00b::"		;# AX server side IPv6 network
set testBed(ax_srv_IPv4_mask)	"16"			;# Mask for server side IPv4 (Do not change)
set testBed(ax_srv_IPv6_mask)	"64"			;# Mask for server side IPv6 (Do not change)
# This file contain all information related to test bed, like all links between DUTs, access information, etc
set ATAF(AXAPI_CONVERT)         "0"
set ATAF(LOG_TO_CONSOLE)	"1"
set ATAF(SYSTEM_DEBUG)		"0"
set ATAF(CLEAN_SYSTEM_ID)       "1"
set ATAF(CLEAN_SYSTEM)		"0"
set ATAF(CHECK_USAGE)		"0"
                                                                                                                                                                                                                                                    
set ATAF(LAB_DEFAULT_GATEWAY) "10.65.16.1"
set ATAF(KEEP_CONFIG_ITEM_LIST) [list "system promiscuous-mode" "no debug packet" "terminal width 0"]
set DEVICE_INFO(AX1.mgmt_ip)		$AX1
set DEVICE_INFO(AX1.term_ip)		$TERM_SRV
set DEVICE_INFO(AX1.term_port)		$AX1_TERM_PORT
set DEVICE_INFO(AX1.login_name)		"admin"
set DEVICE_INFO(AX1.login_password)	"a10"
set DEVICE_INFO(AX1.enable_password)	""
set DEVICE_INFO(AX1.description)	"ax"
set DEVICE_INFO(AX1.link_to.RTR1.Cli1)	"1"
set DEVICE_INFO(AX1.link_to.RTR1.Cli2)	"1"
set DEVICE_INFO(AX1.link_to.RTR1.Srv1)	"2"
set DEVICE_INFO(AX1.link_to.RTR1.Srv2)	"2"
set DEVICE_INFO(AX1.link_to.AX2.1)	"5"
set DEVICE_INFO(AX1.link_to.AX2.2)	"6"
set DEVICE_INFO(AX2.mgmt_ip)		$AX2
set DEVICE_INFO(AX2.term_ip)		$TERM_SRV
set DEVICE_INFO(AX2.term_port)		$AX2_TERM_PORT
set DEVICE_INFO(AX2.login_name)		"admin"
set DEVICE_INFO(AX2.login_password)	"a10"
set DEVICE_INFO(AX2.enable_password)	""
set DEVICE_INFO(AX2.description)	"ax"
set DEVICE_INFO(AX2.link_to.RTR1.Cli1)	"1"
set DEVICE_INFO(AX2.link_to.RTR1.Cli2)	"1"
set DEVICE_INFO(AX2.link_to.RTR1.Srv1)	"2"
set DEVICE_INFO(AX2.link_to.RTR1.Srv2)	"2"
set DEVICE_INFO(AX2.link_to.AX1.1)	"5"
set DEVICE_INFO(AX2.link_to.AX1.2)	"6"
set DEVICE_INFO(RTR1.mgmt_ip)		$RTR1
set DEVICE_INFO(RTR1.term_ip)		$TERM_SRV
set DEVICE_INFO(RTR1.term_port)		$RTR1_TERM_PORT
set DEVICE_INFO(RTR1.login_name)	"admin"
set DEVICE_INFO(RTR1.login_password)	"a10"
set DEVICE_INFO(RTR1.enable_password)	""
set DEVICE_INFO(RTR1.description)	"ax"
set DEVICE_INFO(RTR1.link_to.CLI1.1)	"1"
set DEVICE_INFO(RTR1.link_to.CLI1.2)	"1"
set DEVICE_INFO(RTR1.link_to.SRV1.1)	"2"
set DEVICE_INFO(RTR1.link_to.SRV1.2)	"2"
set DEVICE_INFO(RTR1.link_to.AX1.Cli1)	"3"
set DEVICE_INFO(RTR1.link_to.AX1.Cli2)	"3"
set DEVICE_INFO(RTR1.link_to.AX2.Cli1)	"6"
set DEVICE_INFO(RTR1.link_to.AX2.Cli2)	"6"
set DEVICE_INFO(RTR1.link_to.AX1.Srv1)	"4"
set DEVICE_INFO(RTR1.link_to.AX1.Srv2)	"4"
set DEVICE_INFO(RTR1.link_to.AX2.Srv1)	"7"
set DEVICE_INFO(RTR1.link_to.AX2.Srv2)	"7"
set DEVICE_INFO(CLI1.mgmt_ip)		$CLI1
set DEVICE_INFO(CLI1.term_ip)		"NONE"
set DEVICE_INFO(CLI1.term_port)		"NONE"
set DEVICE_INFO(CLI1.login_name)	"root"
set DEVICE_INFO(CLI1.login_password)	"password"
set DEVICE_INFO(CLI1.enable_password)	""
set DEVICE_INFO(CLI1.description)	"linux"
set DEVICE_INFO(CLI1.link_to.RTR1.1)	"eth1"
set DEVICE_INFO(CLI1.link_to.RTR1.2)	"eth2"
set DEVICE_INFO(SRV1.mgmt_ip)		$SRV1
set DEVICE_INFO(SRV1.term_ip)		"NONE"
set DEVICE_INFO(SRV1.term_port)		"NONE"
set DEVICE_INFO(SRV1.login_name)	"root"
set DEVICE_INFO(SRV1.login_password)	"password"
set DEVICE_INFO(SRV1.enable_password)	""
set DEVICE_INFO(SRV1.description)	"linux"
set DEVICE_INFO(SRV1.link_to.RTR1.1)	"eth1"
set DEVICE_INFO(SRV1.link_to.RTR1.2)	"eth2"