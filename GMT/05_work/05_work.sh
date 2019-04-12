out_ps=05_work.ps
input_list=rainfall.list

cpt=05_work.cpt

gmt set PS_MEDIA A4 

gmt makecpt -T0/25/5 -Cjet -Z > $cpt

gmt psxy -R0/1/0/1 -JX1c -T -K -P > $out_ps
gmt psbasemap -R119/123/21/26 -Jm3 -BwEsN -B1 -G187/255/255 -X-0.5 -Y5 -O -K>> $out_ps
gmt psbasemap -R -J -B+t190412Rainfall -O -K>> $out_ps
gmt pscoast -R -J -B -W0.5 -G255/250/205 -Df -Ia -O -K >> $out_ps
awk '{if ($3>=0 && $3<10) print $1, $2, $3 }' $input_list | gmt psxy -R -J -Sc0.05 -C$cpt -O -K >> $out_ps
awk '{if ($3>=10 && $3<15) print $1, $2, $3 }' $input_list | gmt psxy -R -J -Sc0.07 -W0.001 -C$cpt -O -K >> $out_ps
awk '{if ($3>=15 && $3<20) print $1, $2, $3 }' $input_list | gmt psxy -R -J -Sc0.09 -W0.001 -C$cpt -O -K >> $out_ps
awk '{if ($3>=20 && $3<25) print $1, $2, $3 }' $input_list | gmt psxy -R -J -Sc0.11 -W0.001 -C$cpt -O -K >> $out_ps

gmt makecpt -Cjet -T0/40 > q.cpt
gmt psscale -Cq.cpt -DJRM+w3i/0.25i+o1i/0+mc -R -J -O -K -F+p+i -Bxa10 -By+l"mm" >> $out_ps

gmt psxy -R -J -O -T >> $out_ps
gmt psconvert $out_ps -P -Tf
gmt psconvert $out_ps -P -Tg

