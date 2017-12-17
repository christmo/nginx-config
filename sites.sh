#!/usr/bin/env bash 

set -e

declare -A SITES

SITES["blog.dbogatov.org"]=""
SITES["legacy.dbogatov.org"]=""
SITES["socialimps.dbogatov.org"]=""
SITES["push.dbogatov.org"]=""

SITES["nigmatullina.org"]=""

SITES["darinagulley.com"]=""

SITES["shevastream.com"]=""

SITES["visasupport.com.ua"]=""
SITES["eu.visasupport.kiev.ua"]="visasupport-kiev-ua:8001"
SITES["lp.visasupport.kiev.ua"]="visasupport-kiev-ua:8002"
SITES["travelus.com.ua"]="visasupport-kiev-ua:8003"
SITES["visajapan.com.ua"]="visasupport-kiev-ua:8004"
SITES["visasupport.kiev.ua"]="visasupport-kiev-ua:8005"
SITES["zima.visasupport.com.ua"]="visasupport-kiev-ua:8006"

SITES["veles-russia.com"]=""

SITES["vleskniga.com"]=""

SITES["blog.bogatov.kiev.ua"]=""
SITES["bogatov.kiev.ua"]=""

SITES["status.dbogatov.org"]="status_nginx"
