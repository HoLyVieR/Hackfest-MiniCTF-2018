#!/bin/bash

tmpfile=$(mktemp /tmp/challenge.XXXXXX)
chmod 777 "$tmpfile"

echo "What's your name ?"
read name

if [[ $name =~ ^[a-zA-Z0-9\ ]*$ ]]; then
	echo "#!/bin/bash" >> "$tmpfile"
	echo "echo 'Hello $name!'" >> "$tmpfile"
	chmod +x "$tmpfile"
	eval "$tmpfile"
else
	echo "Invalid name"
	exit
fi

rm "$tmpfile"
