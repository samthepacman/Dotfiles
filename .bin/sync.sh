#!/usr/bin/env bash

USAGE=$(cat <<ENDSTR
Usage: ${0/\.\//} <command> [arguments]
COMMANDS :
   shell - ssh into android termux shell
   files - mount termux android files
   unmount - Use this command instead of UNMOUNTING DIRECTLY
		
ENDSTR
)

command="$1"
shift
case "$command" in

	help|--help)
        	echo $VERSION
		echo "$USAGE"
		;;

#...........................................
	shell) 
	  ssh phone
		;;
	files) 
	  sshfs phone:storage $HOME/Phone -o follow_symlinks
		;;
	unmount)
	  fusermount -u $HOME/Phone
		;;
#...........................................
	*)
		[ -z $command ] || echo Unknown command: $command
		echo "$USAGE"
		;;
esac
