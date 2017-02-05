#!/bin/sh

DIR="$( cd "$( dirname "$0" )" && pwd )"

rsync -avz $DIR/../target/*.war deploy@testing.nkb:/srv/tomcat6/webapps/nkbcomment.war

