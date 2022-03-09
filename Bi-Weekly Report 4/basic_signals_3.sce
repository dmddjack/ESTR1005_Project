//Program 03: Aliasing in Time
//use the same program used in program02
//fn=signal freq=60//sampling freq=600
//**sampling theorem or nqyuist rate fs>2*fn
//600>2*60=True - no aliasing in Sampling
//Make sampling frequency reduce  <2fn which would produce aliasing in this program

//CT signal program
f=60
tmin=-0.05;
tmax=0.05;
t=linspace(tmin,tmax,400);
x_c=cos(2*%pi*f*t);
subplot(3,1,1)
plot(t,x_c)

xlabel('t(seconds)')

//Sampling with fs < 2fn(120), select fs=70
Ts=1/70;//sampling frequency changed (rest of program same as previous)   ***cause aliasing

nmin=ceil(tmin/Ts);//xc(nTs)=xc(t)
nmax=floor(tmax/Ts);
n=nmin:nmax;
x1=cos(2*%pi*f*n*Ts);
subplot(3,1,2)
plot(n*Ts,x1,'.')
subplot(3,1,3)
plot(n*Ts,x1,'b-d',"MarkerSize",6)
