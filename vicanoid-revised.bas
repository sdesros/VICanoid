!--------------------------------------------------
!- Friday, September 3, 2021 11:14:52 AM
!- Import of :
!- d:\steph\vicanoid.prg
!- Unexpanded VIC20 / C16 / Plus4
!--------------------------------------------------
1 PRINT"{clear}vikanoid"
2 PRINT:PRINT"use the cursor keys tomove your paddle"
3 PRINT:PRINT"the symbols in the{space*4}game are:"
4 PRINT:PRINT"e-explosion"
5 PRINT"p-points (500)"
6 PRINT"f-fire(space)"
7 GOTO 102
!- Start the level, set volume, initialize ball direction going left and up at the bottom at a random spot
!- Variables:
!- DX: Ball's' horizontal direction
!- DY: ball's veritical direction
!- X: ball's x position
!- Y: balls's y position
!- PB: ball's previous real position
!- P: ball's current real position
!- SC: score
!- L: lives
!- B: current level
!- R: number of blocks left on current level
!- M: paddle's current x position (left-most component)
!- F: F=1 when game is handling the "F" block
!- A$: the result of the keyboard presses
!- K: the numeric value for A$ (used to catch the 1-8 cheat code)
!- I, T: FOR LOOP Counters
!- PP: used in draw subroutines to calculate the potential position of special blocks.
8 PRINT"{clear}":POKE36879,10:POKE36878,15:DX=-1:DY=-1:X=INT(RND(1)*21):Y=20:PB=0:GOSUB 91
!- Call the level draw subroutine for the current level
9 ON B GOSUB 34,37,40,43,52,57,69,77
!- Display the score and Lives and draw the paddle
10 PRINT"{home}{white}score:";SC;" {home}{right*14}lives:";L:GOSUB84
!- IF the ball hits the E block
11 IFPEEK(P)=5THENGOSUB 92
!- IF the ball hits the point block
12 IFPEEK(P)=16THENSC=SC+490
!- if the ball hits the F block
13 IFPEEK(P)=6THENGOSUB95
!- if the ball hits anything else change vertical direction, make sound add points, reduce block count
14 IFPEEK(P)<>32THEN:DY=-DY:R=R-1:SC=SC+10:POKE36876,220
!- if the ball hits the paddle reinstate the count and redraw the paddle
15 IFPEEK(P)=120ORPEEK(P)=124ORPEEK(P)=126ORPEEK(P)=81THENR=R+1:GOSUB 80
!- if the ball hits the edges of the paddle tweak horizontal speed.
16 IFPEEK(P)=124THENDX=DX-0.1:IFDX<-2THENDX=-2
17 IFPEEK(P)=126THENDX=DX+0.1:IFDX>2THENDX=2
!- if the ball hits the hatched block, reverse horizontal direction of ball!-
18 IFPEEK(P)=102THENDX=-DX
!- if all the blocks are cleared:
!- * increase lives by 3 (max total lives is 9)
!- * set the level to the next one (cycle back to level 1 when moving past level 8)
19 IFR=0ORR<0THENB=B+1:L=L+3:IFB>8THENB=1
20 IFL>9THENL=9
21 IFR=0ORR<0THENGOTO8
!- Erase ball's at previous position, draw ball in new position
22 IFPB>0THENPOKEPB,32
23 POKEP,81:GOSUB80
!- if ball is at edge of play area horizontally play sound and reverse horizontal direction.
24 X=X+DX:IFX<0THENX=-1
25 IFX>21THENX=22
26 IFX=-1ORX=22THENDX=-DX:X=X+DX:POKE36876,230:IFX<0THENX=0
27 IFX>21THENX=21
!- if ball is at top edge of play area play sound, reverse vertical direction and play sound
28 Y=Y+DY:IFY=0THENDY=-DY:Y=Y+DY:POKE36876,230
!- If ball is on bottom edge of play area, decrease life, repoosition ball, play sound and wait a bit
29 IFY=22THENL=L-1:X=INT(RND(1)*21):Y=20:DY=-1:DX=-1:POKE36876,135:FORI=1TO1000:NEXT
30 POKE36876,0
!- trigger game over on play end.
31 IFL<1THEN100
!- store ball's previous position, calculate new position based on x,y coordinate and continue game loop.
32 PB=P:GOSUB 91
33 GOTO 10
!- START OF LEVEL DRAWING SUBROUTINES
!- level 1
34 FORI=0TO2:PRINT"{space*3}{reverse on}{white} {red} {cyan} {purple} {green} {blue} {yellow} {white} {red} {cyan} {purple} {green} {blue} {yellow} ":NEXT
35 PRINT"{home}{down*2}{right*5}e{right*8}e"
36 R=14*3:RETURN
!- level 2
37 FORI=1TO2:PRINT" {reverse on}{white}{space*2}{reverse off} {reverse on}{red}{space*2}{reverse off} {reverse on}{cyan}{space*2}{reverse off} {reverse on}{purple}{space*2}{reverse off} {reverse on}{green}{space*2}{reverse off} {reverse on}{blue}{space*2}{reverse off} {reverse on}{yellow}{space*2}{reverse off}":NEXT
38 PRINT"{home}{down*2}{right}e{right*3}e{up}{right*6}f{down}{right*3}e{right*3}e"
39 R=29:RETURN
!- level 3
40 FORI=0TO2:PRINT"{right}{white}{reverse on}{space*10}{reverse off}{cm +}{reverse on}{yellow}{space*9}{reverse off}":NEXT
41 R=60:PRINT"{home}{down*2}{right*2}f{right}{up}p{right}{down*2}p{right}e{right*2}{up*2}f{right}{down*2}f{right}{up}p{right*2}p{up}f";
42 RETURN
!- level 4
43 FORI=1TO20
44 PP=7746+INT(RND(1)*(12*22)):IFPEEK(PP)<>32THENGOTO44
45 POKEPP,102:NEXT
46 FORI=0TO2:PRINT"{space*5}{purple}{reverse on}{space*11}{reverse off}":NEXT
47 FORI=1TO4
48 PP=7727+INT(RND(1)*11)+(INT(RND(1)*2)*22):IFPEEK(PP)<>160THEN48
49 POKEPP,5
50 PP=7705++INT(RND(1)*11)+(INT(RND(1)*2)*22):IFPEEK(PP)<>160THEN50
51 POKEPP,6:NEXT:R=52:RETURN
!- level 5
52 R=22*4:FORI=1TO3:PRINT"{reverse on}{white}{space*8}{cyan}{space*8}{yellow}{space*6}{reverse off}{white}":NEXT
53 FORI=1TO5:PP=7701+INT(RND(1)*(21*6))+1:IFPEEK(PP)=32THENR=R+1
54 POKEPP,16:PP=7724+INT(RND(1)*(21*5)):IFPEEK(PP)=32THENR=R+1
55 POKEPP,5:PP=7701+INT(RND(1)*(21*6)):IFPEEK(PP)=32THENR=R+1
56 POKEPP,6:NEXT:PRINT"{cm +*22}":RETURN
!- level 6
57 PRINTTAB(10);:FORT=1TO15STEP2:FORI=1TOT
58 IFT=1THENPRINT"{yellow}{cm i}";
59 IFI=1ANDT<>1THENPRINT"{yellow}{reverse on}{sh pound}{reverse off}";
60 IFT<>1ANDI<>1ANDI<>TTHENPRINT"{yellow}{reverse on} {reverse off}";
61 IFT<>1ANDI=TTHENPRINT"{yellow}{reverse on}{cm asterisk}{reverse off}";
62 NEXTI:PRINT"{down}";:FORK=1TOT+1:PRINT"{left}";:NEXTK,T
63 PP=7780+INT(RND(1)*188):IFPEEK(PP)<33THEN63
64 POKEPP,5
65 PP=7702+INT(RND(1)*188):IFPEEK(PP)<33THEN65
66 POKEPP,6
67 PP=7702+INT(RND(1)*188):IFPEEK(PP)<33THEN67
68 POKEPP,16:R=64:RETURN
!- level 7
69 FORI=1TO2:PRINT"{green}{space*2}{reverse on} {reverse off}{space*14}{reverse on} {reverse off}":NEXT
70 PRINT"{reverse on}{right*3}{space*2}{right*10}{space*2}"
71 PRINT"{reverse on}{right*5} {right*8} "
72 PRINT"{reverse on}{right*6} {right*6} "
73 PRINT"{reverse on}{right*7}{space*6}"
74 PRINT"{reverse on}{right*7} {reverse off}{red}e{green}{reverse on}{space*2}{reverse off}{red}e{green}{reverse on} "
75 PRINT"{reverse on}{right*7} {reverse off}{red}fp{green}{reverse off}{red}pf{green}{reverse on} ":PRINT"{reverse on}{right*7}{space*6}"
76 PRINT"{reverse on}{right*9}{space*2}";:R=38:RETURN
!- level 8
77 PRINT"{space*5}{white}NMNMNMNMNM":PRINT"{space*5}{reverse on}{yellow}{space*10}":PRINT"{space*5}epfefpefpe"
78 PRINT"{space*5}{reverse on}{cyan}{space*10}"
79 PRINT:FORI=1TO2:PRINT"{space}{cm +*2}e{cm +*2}{reverse on}{space*10}{reverse off}{cm +*2}e{cm +*2}":NEXT:R=80:RETURN
!- END OF LEVEL DRAWING SUBROUTINES
!- paddle control subroutine
80 GETA$:IFA$="{down}"ANDM>0THENM=M-1
81 IFA$="{right}"ANDM<19ANDF<>1THENM=M+1
82 IFA$="{right}"ANDM<21ANDF=1THENM=M+1
83 RETURN
!- paddle drawing subroutine
84 PRINT"{home}{down*21}";
85 IFM>0THENPRINTSPC(M-1);"{space}";
86 IFF<>1THENPRINT"{cyan}{cm c}{cm u}{cm v}";
87 IFF=1THENPRINT"{cyan}^";
88 IFM<19ANDF<>1THENPRINT"{space}";
89 IFM<21ANDF=1THENPRINT"{space}";
90 RETURN
!- canvert ball's x,y positions to screen position suroutine
91 P=INT(7680+X+22*Y):RETURN
!- handle "E" block subroutine
!- erase boards in a 3,3 block around "E" block, count any elements removed except for the ball.
92 POKE36877,135:FORT=-1TO1:FORY=-1TO1
93 IFPEEK(P+T+(22*Y))<>32THENIFPEEK(P+T+(22*Y))<>81THENR=R-1:POKE36876,220:SC=SC+10
94 POKEP+T+(22*Y),32:NEXTY,T:POKE36877,0:RETURN
!- handle "F" block subroutine
!- first set to F mode, write instructions, use the paddle control and drawing subroutines to move
!- the paddle and wait for the user to press the ENTER key.
95 PRINT"{home}press space to fire!  {home}{down*21}{space*21}";:F=1:POKEP,32:IFPB>0THENPOKEPB,32
96 GOSUB80:IFA$<>" "THENGOSUB84:GOTO96
!- the enter key was pressed, play a sound, shoot the ^ vertically from bottom to top of play
!- and erase and count any non-ball entities that were destroyed, reset the F flag.
97 POKE36876,200:FORI=M+8164TOM+7702STEP-22:IFPEEK(I)<>32ANDI<8165THENR=R-1:SC=SC+10
98 POKEI,30:POKEI,32:NEXT:POKE36876,0:F=0:PRINT"{home}{white}{space*21}";:IFM>19THENM=19
99 RETURN
!- game over routine
100 PRINT"{home}{down*3}{white}you missed!!"
101 PRINT:PRINT"your score was ";SC:FORI=1TO1000:NEXT
!- shared press any key routine, scan for 1-8 key to set the level, otherwise start at level 1 and reset all variables.
102 PRINT"press any key"
103 GETA$:IFA$=""THEN 103
104 K=VAL(A$):B=1:IFK>0ANDK<9THENB=K
105 SC=0:L=3:M=10:F=0:R=1:GOTO 8