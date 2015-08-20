#!/bin/bash

case $1 in
    'bash')
	rsync -rvc .bashrc* ~/
        ;;

    'vim')
	;;
esac

