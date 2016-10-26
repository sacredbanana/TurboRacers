'Turbo Racers by Cameron Armstrong

maxtracknum=6
anglea=0
angleb=93.17983012
anglec=183.1798301

label top
open window 640,512
dim red(3),green(3),blue(3)
for a=1 to 3
red(a)=ran(255)
green(a)=ran(255)
blue(a)=ran(255)
next a
command=1
players=1
track=1
laps=1
racedim=2
difficulty=1
label start
setdrawbuf db
db=1-db
setdispbuf db
for a=1 to 3
if red(a)>255 red(a)=255 
if green(a)>255 green(a)=255
if blue(a)>255 blue(a)=255
if red(a)<0 red(a)=0
if green(a)<0 green(a)=0
if blue(a)<0 blue(a)=0
setrgb a,red(a),green(a),blue(a)
gtriangle 0,0 to 0,512 to 640,512
gtriangle 0,0 to 640,0 to 640,512
red(a)=red(a)+5*(ran(1)-.5)
green(a)=green(a)+5*(ran(1)-.5)
blue(a)=blue(a)+5*(ran(1)-.5)
next a
gtriangle 0,0 to 0,512 to 640,512
gtriangle 0,0 to 640,0 to 640,512
setrgb 1,255-red(3),255-green(3),255-blue(3)
text 250,150,"TURBO RACERS"
setrgb 1,255-red(2),255-green(2),255-blue(2)
text 245,400,"PUSH X TO START"
if peek("port1")=16384 then
setdrawbuf db
clear window
setdispbuf db
db=1-db
setdrawbuf db
clear window
setdispbuf db
goto main
fi
goto start

label main
setdrawbuf dw
clear window
window origin "lt"
dim track(20,20)
if track=1 restore track1
if track=2 restore track2
if track=3 restore track3
if track=4 restore track4
if track=5 restore track5
if track=6 restore track6
if track=7 restore track7
if track=8 restore track8
if track=9 restore track9
if track=10 restore track10
for height=20 to 1 step -1
for width=1 to 20
read track(height,width)
next
next
setrgb 1,0,0,255
for height=20 to 1 step -1
scrx=120
for width=1 to 20
if track(height,width)=1 then
setrgb 1,0,0,255
fill rectangle scrx,scry to scrx+29,scry+20 
fi
if track(height,width)=2 then
setrgb 1,255,0,0
fill rectangle scrx,scry to scrx+29,scry+20 
fi
if track(height,width)=3 then
setrgb 1,255,255,0
fill rectangle scrx,scry to scrx+29,scry+20 
fi
scrx=scrx+20
next
scry=scry+20
next
scry=0
setrgb 1,255,255,0
if peek("port1")=64 and command<5 then
command=command+1
fi
if peek("port1")=16 and command>1 then
command=command-1
fi
if peek("port1")=32 and command=1 and players=1 then
players=2
fi
if peek("port1")=32 and command=2 and track<maxtracknum then
track=track+1
fi
if peek("port1")=32 and command=3 then
laps=laps+1
fi
if peek("port1")=32 and command=4 and racedim=2 then
racedim=3
fi
if peek("port1")=32 and command=5 and difficulty<9 then
difficulty=difficulty+1
fi
if peek("port1")=128 and command=1 and players=2 then
players=1
fi
if peek("port1")=128 and command=2 and track>1 then
track=track-1
fi
if peek("port1")=128 and command=3 and laps>1 then
laps=laps-1
fi
if peek("port1")=128 and command=4 and racedim=3 then
racedim=2
fi
if peek("port1")=128 and command=5 and difficulty>1 then
difficulty=difficulty-1
fi
setrgb 1,0,0,255
for height=20 to 1 step -1
scrx=120
for width=1 to 20
if track(height,width)=1 then
setrgb 1,0,0,255
fill rectangle scrx,scry to scrx+29,scry+20 
fi
if track(height,width)=2 then
setrgb 1,255,0,0
fill rectangle scrx,scry to scrx+29,scry+20 
fi
if track(height,width)=3 then
setrgb 1,255,255,0
fill rectangle scrx,scry to scrx+29,scry+20 
fi
scrx=scrx+20
next
scry=scry+20
next
scry=0
setrgb 1,255,255,255
text 200,300,"No. of players (1-2)"
text 200,330,"Track          (1-"
text 380,330,str$(maxtracknum)
text 400,330,")"
text 200,360,"Laps           (<0)"
text 200,390,"Race Mode    (2D-3D)"
text 200,420,"1P Difficulty  (1-9)"
setrgb 1,0,255,0
text 410,300,str$(players)
text 410,330,str$(track)
text 410,360,str$(laps)
rd$=str$(racedim)+"D"
text 410,390,rd$
text 410,420,str$(difficulty)
setrgb 1,255,0,0
text 200,450,"PRESS START TO CONTINUE"
if peek("port1")=8 and racedim=2 then
scry=100
if track=1 restore track1
if track=2 restore track2
if track=3 restore track3
setrgb 1,0,0,255
for height=1 to 20
scrx=120
for width=1 to 20
if track(height,width)=1 then
setrgb 1,0,0,255
fill rectangle scrx,scry to scrx+30,scry+20 
fi
if track(height,width)=2 then
setrgb 1,255,0,0
fill rectangle scrx,scry to scrx+30,scry+20 
p1xl=width
p1yl=3+height
p2xl=width
p2yl=3+height
fi
if track(height,width)=3 then
setrgb 1,255,255,0
fill rectangle scrx,scry to scrx+29,scry+20 
fi
scrx=scrx+20
next
scry=scry+20
next
p1xs=20
p1ys=10
p2xs=10
p2ys=10
p1clap=1
p2clap=1
p2dir=1
p1ang=0
p2ang=0
goto dim2
fi
setrgb 1,255,255,0
if command=1 text 175,300,"->"
if command=2 text 175,330,"->"
if command=3 text 175,360,"->"
if command=4 text 175,390,"->"
if command=5 text 175,420,"->"
setdispbuf dw
dw=1-dw
if peek("port1")=8 and racedim=3 then
goto dim3
fi
goto main

label dim2
window origin "lb"
setdrawbuf dw
clear window
scry=100
if track=1 restore track1
if track=2 restore track2
if track=3 restore track3
setrgb 1,0,0,255
for height=1 to 20
scrx=0
for width=1 to 20
if track(height,width)=1 then
setrgb 1,0,0,255
fill rectangle scrx,scry to scrx+30,scry+20 
fi
if track(height,width)=2 then
setrgb 1,255,0,0
fill rectangle scrx,scry to scrx+30,scry+20 
fi
if track(height,width)=3 then
setrgb 1,255,255,0
fill rectangle scrx,scry to scrx+29,scry+20 
fi
scrx=scrx+30
next
scry=scry+20
next
scry=0
setrgb 1,255,0,255
text 50,450,"P1 Speed:"
text 50,430,"P2 Speed:"
p1spd$=str$(int(p1speed*10))+" km/h"
p2spd$=str$(int(p2speed*10))+" km/h"
setrgb 1,0,255,255
text 150,450,p1spd$
text 150,430,p2spd$
setrgb 1,255,255,0
text 480,450,"P1 Lap:"
text 480,430,"P2 Lap:"
setrgb 1,255,255,255
text 570,450,"/"
text 570,430,"/"
setrgb 1,0,255,0
text 550,450,str$(p1clap)
text 550,430,str$(p2clap)
text 590,450,str$(laps)
text 590,430,str$(laps)
setrgb 1,255,255,0
setrgb 2,0,255,0
setrgb 3,0,255,0
gtriangle 30*p1xl+p1xs-30,20+20*p1yl+p1ys to 30*p1xl+p1xs+7.5*(sin(p1ang/180*pi+angleb+pi))-30,20+20*p1yl+p1ys+7.5*(cos(p1ang/180*pi+angleb+pi)) to 30*p1xl+p1xs+7.5*(sin(p1ang/180*pi+anglec+pi))-30,20+20*p1yl+p1ys+7.5*(cos(p1ang/180*pi+anglec+pi))
setrgb 2,255,0,0
setrgb 3,255,0,0
gtriangle 30*p2xl+p2xs-30,20+20*p2yl+p2ys to 30*p2xl+p2xs+7.5*(sin(p2ang/180*pi+angleb+pi))-30,20+20*p2yl+p2ys+7.5*(cos(p2ang/180*pi+angleb+pi)) to 30*p2xl+p2xs+7.5*(sin(p2ang/180*pi+anglec+pi))-30,20+20*p2yl+p2ys+7.5*(cos(p2ang/180*pi+anglec+pi))
if and(peek("port1"),32)>0 p1ang=p1ang+5
if and(peek("port1"),128)>0 p1ang=p1ang-5

if and(peek("port1"),16384)>0 p1speed=p1speed+.1

'i component
p1xs=p1xs+p1speed*sin(p1ang/180*pi)
'j component
p1ys=p1ys+p1speed*cos(p1ang/180*pi)

if and(peek("port1"),16384)=0 then
p1speed=p1speed-.2
if p1speed<0 p1speed=0
fi

if players=1 then
up=1
down=2
left=3
right=4

if p2dir=up then
if track(p2yl-2,p2xl)=0 then
p2speed=p2speed-.3
'moving left
if track(p2yl-3,p2xl-1)>0 and p2ul+p2ur+p2dl+p2dr+p2lu+p2ld+p2ru+p2rd=0 then
p2ul=1
p2ur=0
p2dl=0
p2dr=0
p2lu=0
p2ld=0
p2ru=0
p2rd=0
fi
if track(p2yl-2,p2xl-1)>0 or track(p2yl-3,p2xl-1)>0 then
p2ang=p2ang-5
p2ang=p2ang/360
p2ang=frac(p2ang)*360
if p2ang<0 p2ang=360+p2ang
if p2ang<275 and p2ang>265 p2dir=left
fi
'moving right
if track(p2yl-3,p2xl+1)>0 and p2ul+p2ur+p2dl+p2dr+p2lu+p2ld+p2ru+p2rd=0 then
p2ul=0
p2ur=1
p2dl=0
p2dr=0
p2lu=0
p2ld=0
p2ru=0
p2rd=0
fi
if track(p2yl-2,p2xl+1)>0 or track(p2yl-3,p2xl+1)>0 then
p2ang=p2ang+5
p2ang=p2ang/360
p2ang=frac(p2ang)*360
if p2ang<0 p2ang=360+p2ang
if p2ang>85 and p2ang<95 p2dir=right
fi
if p2speed<0 p2speed=0
else 
p2speed=p2speed+.1*.5*difficulty
if p2xs<14 p2ang=p2ang+1
if p2xs>16 p2ang=p2ang-1
if p2xs>14 and p2xs<16 p2ang=0
fi
fi

if p2dir=down then
if track(p2yl-4,p2xl)=0 then
p2speed=p2speed-.3
'moving left
if track(p2yl-3,p2xl-1)>0 and p2ul+p2ur+p2dl+p2dr+p2lu+p2ld+p2ru+p2rd=0 then
p2ul=0
p2ur=0
p2dl=1
p2dr=0
p2lu=0
p2ld=0
p2ru=0
p2rd=0
fi
if track(p2yl-4,p2xl-1)>0 or track(p2yl-3,p2xl-1)>0 then
p2ang=p2ang+5
p2ang=p2ang/360
p2ang=frac(p2ang)*360
if p2ang<0 p2ang=360+p2ang
if p2ang>265 and p2ang<275 p2dir=left
fi
'moving right
if track(p2yl-3,p2xl+1)>0 and p2ul+p2ur+p2dl+p2dr+p2lu+p2ld+p2ru+p2rd=0 then
p2ul=0
p2ur=0
p2dl=0
p2dr=1
p2lu=0
p2ld=0
p2ru=0
p2rd=0
fi
if track(p2yl-4,p2xl+1)>0 or track(p2yl-3,p2xl+1)>0 then
p2ang=p2ang-5
p2ang=p2ang/360
p2ang=frac(p2ang)*360
if p2ang<0 p2ang=360+p2ang
if p2ang>85 and p2ang<95 p2dir=right
fi
if p2speed<0 p2speed=0
else 
p2speed=p2speed+.1*.5*difficulty
if p2xs<14 p2ang=p2ang-1
if p2xs>16 p2ang=p2ang+1
if p2xs>14 and p2xs<16 p2ang=180
fi
fi

if p2dir=left then
if track(p2yl-3,p2xl-1)=0 then
p2speed=p2speed-.3
'moving up
if track(p2yl-2,p2xl)>0 and p2ul+p2ur+p2dl+p2dr+p2lu+p2ld+p2ru+p2rd=0 then 
p2ul=0
p2ur=0
p2dl=0
p2dr=0
p2lu=1
p2ld=0
p2ru=0
p2rd=0
fi
if track(p2yl-2,p2xl-1)>0 or track(p2yl-2,p2xl)>0 then 
p2ang=p2ang+5
p2ang=p2ang/360
p2ang=frac(p2ang)*360
if p2ang<0 p2ang=360+p2ang
if p2ang>355 and p2ang<5 p2dir=up
fi
'moving down
if track(p2yl-4,p2xl)>0 and p2ul+p2ur+p2dl+p2dr+p2lu+p2ld+p2ru+p2rd=0 then
p2ul=0
p2ur=0
p2dl=0
p2dr=0
p2lu=0
p2ld=1
p2ru=0
p2rd=0
fi
if track(p2yl-4,p2xl-1)>0 or track(p2yl-4,p2xl)>0 then
p2ang=p2ang-5
p2ang=p2ang/360
p2ang=frac(p2ang)*360
if p2ang<0 p2ang=360+p2ang
if p2ang>175 and p2ang<185 p2dir=down
fi
if p2speed<0 p2speed=0
else 
p2speed=p2speed+.1*.5*difficulty
if p2ys<9 p2ang=p2ang+1
if p2ys>11 p2ang=p2ang-1
if p2ys>9 and p2ys<11 p2ang=270
fi
fi

if p2dir=right then
if track(p2yl-3,p2xl+1)=0 then
p2speed=p2speed-.3
'moving up
if track(p2yl-2,p2xl)>0 and p2ul+p2ur+p2dl+p2dr+p2lu+p2ld+p2ru+p2rd=0 then 
p2ul=0
p2ur=0
p2dl=0
p2dr=0
p2lu=0
p2ld=0
p2ru=1
p2rd=0
fi
if track(p2yl-2,p2xl+1)>0 or track(p2yl-2,p2xl)>0 then 
p2ang=p2ang-5
p2ang=p2ang/360
p2ang=frac(p2ang)*360
if p2ang<0 p2ang=360+p2ang
if p2ang>355 and p2ang<5 p2dir=up
fi
'moving down
if track(p2yl-4,p2xl)>0 and p2ul+p2ur+p2dl+p2dr+p2lu+p2ld+p2ru+p2rd=0 then
p2ul=0
p2ur=0
p2dl=0
p2dr=0
p2lu=0
p2ld=0
p2ru=0
p2rd=1
fi
if track(p2yl-4,p2xl+1)>0 or track(p2yl-4,p2xl)>0 then
p2ang=p2ang+5
p2ang=p2ang/360
p2ang=frac(p2ang)*360
if p2ang<0 p2ang=360+p2ang
if p2ang>175 and p2ang<185 p2dir=down
fi
if p2speed<0 p2speed=0
else 
p2speed=p2speed+.1*.5*difficulty
if p2ys<9 p2ang=p2ang-1
if p2ys>11 p2ang=p2ang+1
if p2ys>9 and p2ys<11 p2ang=90
fi
fi

if p2speed<2 then
if p2ul=1 or p2dr=1 or p2ld=1 or p2ru=1 p2ang=p2ang-5
if p2ur=1 or p2dl=1 or p2lu=1 or p2rd=1 p2ang=p2ang+5
if p2ur+p2dl+p2lu+p2rd+p2ul+p2dr+p2ld+p2ru=0 then
if p2dir=up then
for p2ang=p2ang to 0 step 10
if p2ang>360 p2ang=0 
next p2ang
fi
if p2dir=down then
for p2ang=p2ang to 180 step 10
if p2ang>360 p2ang=0 
next p2ang
fi
if p2dir=left then
for p2ang=p2ang to 270 step 10
if p2ang>360 p2ang=0 
next p2ang
fi
if p2dir=right then
for p2ang=p2ang to 90 step 10
if p2ang>360 p2ang=0 
next p2ang
fi
fi
p2speed=p2speed+.1
p2ang=p2ang/360
p2ang=frac(p2ang)*360
if p2ang<0 p2ang=360+p2ang
if p2ang>355 or p2ang<5 then
p2dir=up
p2ang=0
p2ul=0
p2ur=0
p2dl=0
p2dr=0
p2lu=0
p2ld=0
p2ru=0
p2rd=0
fi
if p2ang>175 and p2ang<185 then
p2dir=down
p2ang=180
p2ul=0
p2ur=0
p2dl=0
p2dr=0
p2lu=0
p2ld=0
p2ru=0
p2rd=0
fi
if p2ang>265 and p2ang<275 then
p2dir=left
p2ang=270
p2ul=0
p2ur=0
p2dl=0
p2dr=0
p2lu=0
p2ld=0
p2ru=0
p2rd=0
fi
if p2ang>85 and p2ang<95 then
p2dir=right
p2ang=90
p2ul=0
p2ur=0
p2dl=0
p2dr=0
p2lu=0
p2ld=0
p2ru=0
p2rd=0
fi
fi
fi

if players=2 then
if and(peek("port2"),32)>0 p2ang=p2ang+5
if and(peek("port2"),128)>0 p2ang=p2ang-5
if and(peek("port2"),16384)>0 p2speed=p2speed+.1
if and(peek("port2"),16384)=0 then
p2speed=p2speed-.2
if p2speed<0 p2speed=0
fi
fi
'i component
p2xs=p2xs+p2speed*sin(p2ang/180*pi)
'j component
p2ys=p2ys+p2speed*cos(p2ang/180*pi)

if p1xs>30 then
if track(p1yl-3,p1xl+1)>0 then
p1xs=0
p1xl=p1xl+1
else
p1speed=0
p1xs=30
fi
fi
if p2xs>30 then
if track(p2yl-3,p2xl+1)>0 then
p2xs=0
p2xl=p2xl+1
else
p2speed=0
p2xs=30
fi
fi
if p1ys>20 then
if track(p1yl-2,p1xl)>0 then
if track(p1yl-2,p1xl)=2 p1clap=p1clap+1
p1ys=0
p1yl=p1yl+1
else
p1speed=0
p1ys=20
fi
fi
if p2ys>20 then
if track(p2yl-2,p2xl)>0 then
if track(p2yl-2,p2xl)=2 p2clap=p2clap+1
p2ys=0
p2yl=p2yl+1
else
p2speed=0
p2ys=20
fi
fi
if p1xs<0 then
if track(p1yl-3,p1xl-1)>0 then
p1xs=30
p1xl=p1xl-1
else
p1speed=0
p1xs=0
fi
fi
if p2xs<0 then
if track(p2yl-3,p2xl-1)>0 then
p2xs=30
p2xl=p2xl-1
else
p2speed=0
p2xs=0
fi
fi
if p1ys<0 then
if track(p1yl-4,p1xl)>0 and track(p1yl-4,p1xl)<>2 then
p1ys=20
p1yl=p1yl-1
else
p1speed=0
p1ys=0
fi
fi
if p2ys<0 then
if track(p2yl-4,p2xl)>0 and track(p2yl-4,p2xl)<>2  then
p2ys=20
p2yl=p2yl-1
else
p2speed=0
p2ys=0
fi
fi
if p1clap>laps goto p1vict
if p2clap>laps goto p2vict
if track(p1yl-3,p1xl)=3 p1speed=2*p1speed
if track(p2yl-3,p2xl)=3 p2speed=2*p2speed
setdispbuf dw
dw=1-dw
goto dim2

label p1vict
for effect=1 to 500
setdrawbuf 1
setrgb 1,0,255,0
text 250,300,"PLAYER 1 WINS!!!"
setrgb 1,255,255,0
setrgb 2,0,255,0
setrgb 3,0,255,0
gtriangle 30*p1xl+p1xs-30,20+20*p1yl+p1ys+effect to 30*p1xl+p1xs+(7.5+effect)*(sin(p1ang/180*pi+angleb+pi))-30-effect,20+20*p1yl+p1ys+(7.5+effect)*(cos(p1ang/180*pi+angleb+pi))-effect to 30*p1xl+p1xs+(7.5+effect)*(sin(p1ang/180*pi+anglec+pi))-30+effect,20+20*p1yl+p1ys+(7.5+effect)*(cos(p1ang/180*pi+anglec+pi))-effect
p1ang=2*effect
setdispbuf 1
next effect
wait 3
clear window
goto main

label p2vict
for effect=1 to 500
setdrawbuf 1
setrgb 1,255,0,0
text 250,300,"PLAYER 2 WINS!!!"
setrgb 1,255,255,0
setrgb 2,255,0,0
setrgb 3,255,0,0
gtriangle 30*p2xl+p2xs-30,20+20*p2yl+p2ys+effect to 30*p2xl+p2xs+(7.5+effect)*(sin(p2ang/180*pi+angleb+pi))-30-effect,20+20*p2yl+p2ys+(7.5+effect)*(cos(p2ang/180*pi+angleb+pi))-effect to 30*p2xl+p2xs+(7.5+effect)*(sin(p2ang/180*pi+anglec+pi))-30+effect,20+20*p2yl+p1ys+(7.5+effect)*(cos(p2ang/180*pi+anglec+pi))-effect
p2ang=2*effect
setdispbuf 1
next effect
wait 3
clear window
goto main

'0=blank space
'1=normal track
'2=starting point
'3=turbo road

label track1
data 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
data 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
data 0,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,0
data 0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0
data 0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0
data 0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0
data 0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0
data 0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0
data 0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0
data 0,0,2,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0
data 0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0
data 0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0
data 0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0
data 0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0
data 0,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,0
data 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
data 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
data 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
data 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
data 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0

label track2
data 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
data 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
data 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
data 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
data 0,0,0,0,1,1,1,1,1,0,0,0,1,1,1,1,0,0,0,0
data 0,0,0,0,1,0,0,0,1,0,0,0,1,0,0,1,0,0,0,0
data 0,0,0,0,1,0,0,0,1,1,1,1,1,0,0,1,0,0,0,0
data 0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0
data 0,0,0,0,2,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0
data 0,0,0,0,1,0,0,0,1,1,1,1,1,0,0,1,0,0,0,0
data 0,0,0,0,1,0,0,0,1,0,0,0,1,0,0,1,0,0,0,0
data 0,0,0,0,1,1,1,1,1,0,0,0,1,1,1,1,0,0,0,0
data 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
data 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
data 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
data 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
data 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
data 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
data 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
data 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0

label track3
data 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
data 0,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
data 0,1,0,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
data 0,1,0,0,1,1,0,0,0,0,0,1,1,1,1,0,0,0,0,0
data 0,1,0,0,0,1,1,0,0,0,1,1,0,0,1,1,0,0,0,0
data 0,2,0,0,0,0,1,1,1,1,1,0,0,0,0,1,1,0,0,0
data 0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0
data 0,1,0,0,0,0,0,1,1,1,1,1,1,1,0,0,1,0,0,0
data 0,1,1,1,1,1,0,1,0,0,0,0,0,1,0,0,1,0,0,0
data 0,0,0,0,0,1,0,1,0,0,0,0,0,1,0,1,1,0,0,0
data 0,0,0,0,0,1,0,1,0,0,0,0,0,1,1,1,0,0,0,0
data 0,0,0,0,0,1,0,1,0,0,0,0,0,0,0,0,0,0,0,0
data 0,0,0,0,0,1,0,1,0,0,0,0,0,0,0,0,0,0,0,0
data 0,0,0,0,1,1,0,1,1,1,0,0,0,0,0,0,0,0,0,0
data 0,0,0,0,1,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0
data 0,0,0,0,1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0
data 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
data 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
data 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
data 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0

label track4
data 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
data 0,0,0,0,0,0,0,0,1,1,1,0,0,0,0,0,0,0,0,0
data 0,0,0,0,0,0,0,0,1,0,1,0,0,0,1,1,1,0,0,0
data 0,0,0,0,0,0,0,0,1,0,1,0,0,1,1,0,1,1,0,0
data 0,0,0,1,1,1,0,0,1,0,1,0,0,1,0,0,0,1,1,0
data 0,0,0,1,0,1,0,0,1,0,1,0,1,1,0,0,0,0,1,0
data 0,0,0,1,0,1,0,0,2,0,1,0,1,0,0,0,0,0,1,0
data 0,0,0,1,0,1,0,0,1,0,1,0,1,0,0,0,0,0,1,0
data 0,0,0,1,0,1,0,0,1,0,1,0,1,0,0,0,0,0,1,0
data 0,0,0,1,0,1,1,1,1,0,1,0,1,0,0,0,0,0,1,0
data 0,0,0,1,0,0,0,0,0,0,1,0,1,0,0,0,0,0,1,0
data 0,0,0,1,0,0,0,0,0,0,1,0,1,0,0,0,0,0,1,0
data 0,0,0,1,0,0,0,0,0,0,1,0,1,0,0,0,0,0,1,0
data 0,0,0,1,0,0,0,0,0,0,1,0,1,0,0,0,0,0,1,0
data 0,0,0,1,0,0,0,0,0,0,1,0,1,0,0,0,0,0,1,0
data 0,0,0,1,0,0,0,0,0,0,1,1,1,0,0,0,0,0,1,0
data 0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0
data 0,0,0,1,3,3,3,3,3,3,3,3,3,3,3,3,3,3,1,0
data 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
data 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0

label track5
data 3,3,3,3,3,3,3,3,3,3,3,3,0,0,0,0,0,0,0,0
data 3,0,0,0,0,0,0,0,0,0,0,3,0,0,0,0,0,0,0,0
data 3,0,3,1,3,1,3,1,3,1,0,3,0,0,0,0,0,0,0,0
data 3,0,1,0,0,0,0,0,0,3,0,3,0,0,0,0,0,0,0,0
data 3,0,3,0,3,3,3,3,0,1,0,3,0,0,0,0,0,0,0,0
data 3,0,1,0,1,0,0,1,0,3,0,3,0,0,0,0,0,0,0,0
data 3,0,3,0,1,0,0,1,0,1,0,3,0,0,0,0,0,0,0,0
data 3,0,1,0,1,0,0,1,0,3,1,3,1,1,0,0,0,0,0,0
data 3,0,3,0,1,0,0,1,0,1,0,3,0,1,0,0,0,0,0,0
data 3,0,1,0,1,0,0,1,0,3,0,3,0,1,0,0,0,0,0,0
data 3,0,3,0,1,0,0,1,0,1,0,3,0,1,0,0,0,0,0,0
data 3,0,1,0,1,0,0,1,0,3,0,3,0,1,0,0,0,0,0,0
data 3,0,3,0,1,0,0,1,0,1,0,3,0,1,0,0,0,0,0,0
data 3,0,1,0,1,0,0,1,0,3,0,3,0,1,0,0,0,0,0,0
data 3,0,3,0,1,0,0,1,1,1,1,1,0,1,0,0,0,0,0,0
data 3,0,1,0,1,0,0,0,1,1,1,0,0,1,0,0,0,0,0,0
data 3,0,3,0,1,0,0,0,0,2,0,0,0,1,0,0,0,0,0,0
data 3,0,1,1,1,1,1,1,1,1,0,0,0,1,0,0,0,0,0,0
data 3,0,0,0,0,0,0,0,0,1,1,1,1,1,0,0,0,0,0,0
data 3,3,3,3,3,3,3,3,3,3,0,0,0,0,0,0,0,0,0,0

label track6
data 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
data 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
data 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
data 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
data 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
data 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
data 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
data 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
data 0,0,0,0,0,1,1,1,1,1,1,1,0,0,0,0,0,0,0,0
data 0,0,0,0,0,1,1,1,1,1,1,1,0,0,0,0,0,0,0,0
data 0,0,0,0,0,1,1,1,1,1,1,1,0,0,0,0,0,0,0,0
data 0,0,0,0,0,1,1,1,2,1,1,1,0,0,0,0,0,0,0,0
data 0,0,0,0,0,1,1,1,1,1,1,1,0,0,0,0,0,0,0,0
data 0,0,0,0,0,1,1,1,1,1,1,1,0,0,0,0,0,0,0,0
data 0,0,0,0,0,1,1,1,1,1,1,1,0,0,0,0,0,0,0,0
data 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
data 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
data 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
data 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
data 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0

label template
data 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
data 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
data 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
data 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
data 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
data 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
data 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
data 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
data 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
data 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
data 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
data 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
data 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
data 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
data 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
data 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
data 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
data 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
data 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
data 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0










