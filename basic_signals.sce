//Program01: Plot Basic Signals (Impulse, Step, Ramp, Exponential,and Sinusoidal)
//Signal 01 - Impulse Siganal
//Line1 : generate a zero array ofdimension(Row,Column)
y1=zeros(1,21);//1 Row, 21 Column zero matrix
//y1 put 11th value as 1
y1(1,11)=1;
//plot this y1
//subplot(num of rows, num of cols, count)
subplot(3,2,1);//3 rows(horizontal),2 cols(vertical), and count=1 or index =1
//plot2d3 is SCILAB command for discrete signals
plot2d3(y1);//discrete plot feature in SCILAB - DT Signals, plot -> CT signals
title('Unit Impulse');

//Signal 02 - Step signal
y2=zeros(1,21);
y2(1,11:21)=1//make all values from 11 to 21(second half of the signal=1)
subplot(3,2,2);
plot2d3(y2);
title('Unit Step');

//Ramp Signal (Linear signal form 1 to 10)
y3=0:10;//simple colon from 1:10 gives ramp signal
subplot(3,2,3);
plot2d3(y3);
title('Unit Ramp');

//exponential signal
y4=exp(0:2*%pi/100:2*%pi);//pi->%pi-exp(0 to 2*pi in increments(step size)of pi/100)
subplot(3,2,4);
plot (y4);
title('Exponential Increasing');

y5=exp(-(0:2*%pi/100:2*%pi));//decreasing expponential signal,use a negative sign
subplot(3,2,5);
plot(y5);
title('Exponential Decreasing');

//Sinusoidal signal
y6=sin(0:2*%pi/100:8*%pi);//sinusoid cos/sin -> cycles in y6 -> 1 Cycle 0 to 2*pi, 2 Cycle 4*pi.....
subplot(3,2,6);
plot(y6);
title('4 Cycles sin');


//Program 02:CT & DT signals -Continuous Time and Discrete Time Signals
//for CT Signal, use x(t)=cos(wt)=cos(2*pi*f*t) assume that Amp=1,else A*cos(2*pi*f*t) 
//Signal Frequency - FN =50=f
f=60;
//coninuous ttime range from tmin to tmax give time axis on the CT signal
tmin=-0.05;
tmax=0.05;
//linearly spaced 400 points between tmin and tmax(define time axis of CT signal will have 400 points which is high enough to make out signal continuous)
t=linspace(tmin,tmax,400);
//CT Signal cos(2*%pi*f*t)
 x_c=cos(2*%pi*f*t);
 //CT Signal on X-axis which is time axis
subplot(2,1,7);
plot(t,x_c);
xlabel('t(seconds)')//labeling x axis
ylabel('Amplitude');
title('CT Signal');

//DT Signal
//Sampling Frequency/ Period




















