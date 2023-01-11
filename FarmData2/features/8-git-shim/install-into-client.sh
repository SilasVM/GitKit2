PATH_TO_GIT_SHIM="$(pwd)"

PATH_TO_SUB_SHIMS="$PATH_TO_GIT_SHIM/sub-shims"
sed "s@replace-with-path-to-sub-shims@$PATH_TO_SUB_SHIMS@" install-into-shell_template.sh > install-into-shell.sh
chmod +x install-into-shell.sh

printf '# install git-shim\n' >> "${HOME}/.profile"
printf '%s%s%s\n' 'eval "$(' "$PATH_TO_GIT_SHIM/install-into-shell.sh" ')"'  >> "${HOME}/.profile"

bash --login
