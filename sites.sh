#!/bin/bash 

set -e

declare -A SITES

SITES["dbogatov.org"]=""
SITES["blog.dbogatov.org"]=""
SITES["legacy.dbogatov.org"]=""
SITES["socialimps.dbogatov.org"]=""

SITES["nigmatullina.org"]=""

SITES["darinagulley.com"]=""

SITES["shevastream.com"]=""

SITES["visasupport.com.ua"]=""
SITES["eu.visasupport.kiev.ua"]="visasupport:8001"
SITES["lp.visasupport.kiev.ua"]="visasupport:8002"
SITES["travelus.com.ua"]="visasupport:8003"
SITES["visajapan.com.ua"]="visasupport:8004"
SITES["visasupport.kiev.ua"]="visasupport:8005"
SITES["zima.visasupport.com.ua"]="visasupport:8006"

SITESOLD=(
	"nigmatullina.org"
	"dbogatov.org"
	"blog.dbogatov.org"
	"darinagulley.com"
	# "eu.visasupport.kiev.ua"
	# "lp.visasupport.kiev.ua"
	# "visasupport.kiev.ua"
	# "zima.visasupport.com.ua"
	# "visasupport.com.ua"
	# "travelus.com.ua"
	# "bogatov.kiev.ua"
	# "blog.bogatov.kiev.ua"
	# "moon-travel.com.ua"
	# "mail.dbogatov.org"
	# "push.dbogatov.org"
	"shevastream.com"
	# "vpn.dbogatov.org"
	"legacy.dbogatov.org"
	# "visajapan.com.ua"
	"socialimps.dbogatov.org"
	# "status.dbogatov.org"
)
