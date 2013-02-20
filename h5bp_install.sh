VERSION="v4.1.0"
NAME="html5boilerplate$VERSION.zip"
ROOT='.'

if [ -e "$ROOT/public/h5bp" ]
then
	echo "DIRECTORY EXISTS EXITING"
	exit
fi

wget "https://github.com/h5bp/html5-boilerplate/zipball/$VERSION" -O "/tmp/$NAME"

unzip -o "/tmp/$NAME" -d "/tmp/"
mv /tmp/h5bp* "$ROOT/public/h5bp"

rm "/tmp/$NAME"

sed -e '/<p>/s!.*!<div id="canvas">{{{body}}}</div>!;'  \
	  -e '/<title>/s!.*!<title>{{site_title}}</title>!;'  \
		-e 's_="\(js\|css\)_="h5bp/\1_g;'                   \
	   "$ROOT/public/h5bp/index.html" > "$ROOT/views/layout.handlebars"
