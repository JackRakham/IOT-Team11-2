set ant 999
set ite 0
battery set 100

atget id id
getpos2 lonSen latSen

loop
wait 10

read mens
rdata mens tipo valor


print ite
if (ite >= 1000)
	stop
end

if((tipo=="hola") && (ant == 999))
   set ant valor
   data mens tipo id
   send mens * valor
   inc ite
end
if (tipo=="stop")
	data mens "stop"
	send mens * valor
	cprint "Para sensor: " id
	wait 1000
	stop
end
battery bat
if(bat<5)
	data mens "critico" lonSen latSen
	send mens ant
        inc ite
end

if(tipo=="alerta")
   send mens ant
   inc ite
end

areadsensor tempSen
rdata tempSen SensTipo idSens temp

if( temp>30)
   data mens "alerta" lonSen latSen
   send mens ant
   inc ite
end