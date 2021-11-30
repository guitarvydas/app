echo '** copying commands **'
app=${HOME}/app

cp ${app}/querydisplay/querydisplay ${app}/bin
chmod a+x ${app}/bin/querydisplay

cp ${app}/querydisplay2/querydisplay2 ${app}/bin
chmod a+x ${app}/bin/querydisplay2

cp ${app}/setquerydisplay/setquerydisplay ${app}/bin
chmod a+x ${app}/bin/setquerydisplay
