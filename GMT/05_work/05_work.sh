out_ps=05_work.ps

gmt set PS_MEDIA A4 

gmt psxy -R0/1/0/1 -JX1c -T -K -P > $out_ps
gmt psbasemap -R119/123/21/26 -Jm3 -BwEsN -B1 -G187/255/255  -X-0.5 -Y5 -O -K>> $out_ps
gmt pscoast -R -J -B -W0.5 -G255/250/205 -Df -Ia -O -K >> $out_ps

gmt psxy -R -J -O -T >> $out_ps
gmt psconvert $out_ps -P -Tf
gmt psconvert $out_ps -P -Tg