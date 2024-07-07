!--------------------------------------------------
!- July 7, 2024 2:12:01 PM
!- Import of : 
!- c:\users\user\onedrive\documents\vic-20_projects\vicanoid-revised\vicanoid-orig.prg
!- Unexpanded VIC20 / C16 / Plus4
!--------------------------------------------------
2 b=1:sc=0
10 print"{clear}vikanoid"
20 print:print"use the cursor keys tomove your paddle"
30 print:print"the symboles in the{space*3}game are:"
40 print:print"e-explosion"
60 print"p-points (500)"
65 print"f-fire(return)"
70 print:goto 4020
90 print"{clear}":poke36879,10:poke36878,15:dx=-1:dy=-1:m=8152:x=int(rnd(1)*21):y=20:gosub 1000
92 on b gosub 300,320,340,360,380,400,420,440
94 pokem,120:pokem-1,120:pokem+1,120:print"{home}score:"sc
96 ifpeek(p)=5thengosub 2000
98 ifpeek(p)=16thensc=sc+490
100 ifpeek(p)=6thengosub3000
110 ifpeek(p)<>32then:dy=-dy:r=r-1:sc=sc+10
111 ifpeek(p)=120thenr=r+1:gosub 500
112 ifr=0orr<0thenb=b+1:ifb>8thenb=1
113 ifr=0orr<0thengoto90
114 pokep,81:gosub500
116 x=x+dx:ifx=-1orx=22thendx=-dx:x=x+dx:poke36876,230
118 y=y+dy:ify=0thendy=-dy:y=y+dy:poke36876,230
119 poke36876,0
120 ify=22then4000
122 pokep,32:gosub 1000
124 goto 94
300 fort=0to2:print"{space*3}{reverse on}{white} {red} {cyan} {purple} {green} {blue} {yellow} {white} {red} {cyan} {purple} {green} {blue} {yellow} ":next
302 poke7701+int(rnd(1)*(21*3))+1,5
304 r=14*3:return
320 fort=1to2:print"{reverse on}{white}{space*2}{reverse off} {reverse on}{red}{space*2}{reverse off} {reverse on}{cyan}{space*2}{reverse off} {reverse on}{purple}{space*2}{reverse off} {reverse on}{green}{space*2}{reverse off} {reverse on}{blue}{space*2}{reverse off} {reverse on}{yellow}{space*2}{reverse off}":next
322 fori=1to4:poke 7701+int(rnd(1)*(21*3))+1,5:next:poke 7701+int(rnd(1)*(14*3))+1,6
324 r=40:return
340 fort=0to2:print"{white}{reverse on}{space*10}{reverse off}{cm +}{reverse on}{yellow}{space*10}{reverse off}":next
342 r=60:fori=1to4:poke7701+int(rnd(1)*(21*3)),6:poke 7701+int(rnd(1)*(21*2)),16:next
344 poke7701+int(rnd(1)*(21*2)),5
346 return
360 fori=1to20:poke7680+int(rnd(1)*(15*22)),102:next
362 fort=0to2:print"{space*5}{white}{reverse on}{space*11}{reverse off}":next
364 fori=1to4:poke7701+int(rnd(1)*(3*22)),5:poke7701+int(rnd(1)*(2*22)),6:next:r=33:return
380 fori=1to3:print"{reverse on}{white}{space*8}{cyan}{space*8}{yellow}{space*6}{reverse off}{white}":next
382 fori=1to5:poke7701+int(rnd(1)*(21*6))+1,16:poke7701+int(rnd(1)*(21+6)),5
384 poke7701+int(rnd(1)*(21*6)),6:next:print"{cm +*22}"
386 r=(22*3):return
400 printtab(10);:fort=1to15step2:fori=1tot:print"{white}{reverse on} {reverse off}";:nexti:print"{down}";:fork=1tot+1:print"{left}";:nextk,t
402 poke7702+int(rnd(1)*188),5:poke7702+int(rnd(1)*188),6:poke7702+int(rnd(1)*188),16
404 r=64:return
420 fort=1to2:print"{white}{space*2}{reverse on} {reverse off}{space*14}{reverse on} {reverse off}":next
422 print"{reverse on}{right*3}{space*2}{right*10}{space*2}"
424 print"{reverse on}{right*5} {right*8} "
426 print"{reverse on}{right*6} {right*6} "
428 print"{reverse on}{right*7}{space*6}"
430 print"{reverse on}{right*7} {reverse off}e{reverse on}{space*2}{reverse off}e{reverse on} "
432 print"{reverse on}{right*7} {reverse off}fp{reverse off}pf{reverse on} ":print"{reverse on}{right*7}{space*6}"
434 print"{reverse on}{right*9}{space*2}";:r=38:return
440 print"{space*5}{white}NMNMNMNMNM":print"{space*5}{reverse on}{yellow}{space*10}":print"{space*5}epfefpefpe"
441 print"{space*5}{reverse on}{cyan}{space*10}"
442 print:fort=1to2:print"{cm +*22}";:next:r=40:return
500 geta$:ifa$="{down}"andm>8143thenm=m-1:pokem+2,32
502 ifa$="{right}"andm<8162thenm=m+1:pokem-2,32:return
1000 p=7680+x+22*y:return
2000 fort=-1to1:fory=-1to1:ifpeek(p+t+(22*y))<>32thenpokep+t+(22*y),32:r=r-1:poke36876,2:sc=sc+10
2002 nexty,t:poke36877,0:return
3000 gosub500:geta$:ifa$<>chr$(13)thenpokem,120:pokem-1,120:pokem+1,120:goto3000
3002 poke36876,200:fori=mtom-440step-22:ifpeek(m)<>32thenr=r-1:sc=sc+10
3004 pokei,30:poke36876,0:pokei,32:next:return
4000 print"{white}you missed!!"
4010 print:print"your score was "sc
4020 print"press any key"
4030 geta$:ifa$=""then 4030
4040 b=1:sc=0:goto 90
