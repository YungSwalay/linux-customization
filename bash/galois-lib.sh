#===============================================================================
#
#          FILE: galois-lib.sh
#
#         USAGE: . galois-lib.sh
#
#   DESCRIPTION: Contains functions that I have developed as well as those I
#		 have obtained from various sources (always cited) over the
#		 course of years and which I have found useful day-to-day as
#		 well as in my development work
#
#       OPTIONS: N/A
#  REQUIREMENTS: bash
#          BUGS: N/A
#         NOTES: None
#        AUTHOR: Charles Horowitz
#       CREATED: 11/16/2019 12:48:38 PM
#      REVISION: 0.1
#	SOURCES:
#		[1] Pure Bash Bible -
#			https://github.com/dylanaraps/pure-bash-bible
#		[2] Stack Overflow response from user "Paused until further
#		    notice." -
#			https://stackoverflow.com/questions/10768160/ip-address-converter
#===============================================================================

str_split() {
	# Usage: str_split "string" "delimiter"
	# Source: [1]
	IFS=$'\n' read -d "" -ra arr <<< "${1//$2/$'\n'}"
	printf '%s\n' "${arr[@]}"
}

bash_which() {
	# Usage: bash_which "executable"
	local ex="${1}"
	for dir in $(str_split "${PATH}" ":")
	do
		if [[ $dir != */ ]]; then
			dir+=/
		fi
		fpath="${dir}${ex}"
		if [ -x "${fpath}" ]; then
			echo "${fpath}"
			return 0
		fi
	done
	echo "Error: No ${ex} in ${PATH}" 1>&2
	return 1
}

in_array() {
	#Usage: in_array "string" "array"
	for val in "${@:2}"
	do
		if [[ $1 == $val ]]; then
			return 0
		fi
	done
	return 1
}

is_valid_name() {
	# Usage: is_valid_name "variable_name"
	if bash &> /dev/null <<< "${!1-}"; then
		return 0
	else
		return 1
	fi
}

path_join() {
	# Usage: path_join ["pathname" ...]
	local args=($@)
	while [[ ${1: -1} == / ]]
	do
		set -- "${1:: -1}"
	done
	ret="${1}"

	for elem in "${@:2:(($#-2))}"
	do
		while [[ ${elem: -1} == / ]]
		do
			elem="${elem:: -1}"
		done
		while [[ ${elem:: 1} == / ]]
		do
			elem="${elem: 1}"
		done
		ret+="/${elem}"
	done

	larg="${args[${#args[@]}-1]}"
	while [[ ${larg:: 1} == / ]]
	do
		larg="${larg: 1}"
	done
	ret+="/${larg}"

	printf '%s\n' "${ret}"
}

ip_to_decimal() {
	# Usage: ip_to_decimal "ip"
	# Source: [2]
	local ip
	IFS=. read -ra ip <<< "${1}"
	printf '%d\n' "$((ip[0]*256**3 + ip[1]*256**2 + ip[2]*256 + ip[3]))"
}

decimal_to_ip() {
	# Usage: decimal_to_ip "decimal"
	# Source: [2]
	local delim ip dec="${1}"
	for e in {3..0}
	do
		(( octet = dec >> 8*e ))
		(( dec -= octet << 8*e ))
		ip+=$delim$octet
		delim=.
	done
	printf '%s\n' "$ip"
}
