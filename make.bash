echo '** copying commands **'  1>&2
app=${HOME}/app

# pfr and pf
cp ${app}/pfr/pfr ${app}/bin
chmod a+x ${app}/bin/pfr

cp ${app}/pfr/pf ${app}/bin
chmod a+x ${app}/bin/pf


# d2f (d2x for debugging)
cp ${app}/d2f/d2f ${app}/bin
chmod a+x ${app}/bin/d2f

cp ${app}/d2f/d2x ${app}/bin
chmod a+x ${app}/bin/d2x


# querydisplay, querydisplay2, setquerydisplay
cp ${app}/querydisplay/querydisplay ${app}/bin
chmod a+x ${app}/bin/querydisplay

cp ${app}/querydisplay2/querydisplay2 ${app}/bin
chmod a+x ${app}/bin/querydisplay2

cp ${app}/setquerydisplay/setquerydisplay ${app}/bin
chmod a+x ${app}/bin/setquerydisplay

cp ${app}/querydisplay3/querydisplay3 ${app}/bin
chmod a+x ${app}/bin/querydisplay3

# pre
cp ${app}/pre/pre ${app}/bin
chmod a+x ${app}/bin/pre

# das2f
cp ${app}/das2f/das2f ${app}/bin
chmod a+x ${app}/bin/das2f
