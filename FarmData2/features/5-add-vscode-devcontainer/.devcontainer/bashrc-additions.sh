# shellcheck shell=bash

KIT_CLIENT_DIR="${HOME}/.kit"
KIT_USER_NAME_FILE="${KIT_CLIENT_DIR}/kituser.txt"
export KIT_USER_NAME=

if [ ! -f "${KIT_USER_NAME_FILE}" ] ; then
  while [ -z "${KIT_USER_NAME}" ] ; do
    IFS= read -rp "Please enter your name: " KIT_USER_NAME
  done
  mkdir -p "${KIT_CLIENT_DIR}"
  echo "$KIT_USER_NAME" > "${KIT_USER_NAME_FILE}"
else
  KIT_USER_NAME="$(cat "${KIT_USER_NAME_FILE}")"
fi

export PS1="\[\e[1;35m\]${KIT_USER_NAME}\[\e[m:\e[1;36m\w\e[m\] \$ "
