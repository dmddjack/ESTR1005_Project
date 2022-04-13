//Frequency components of a signal
//----------------------------------
// build a noised signal sampled at 1000hz  containing  pure frequencies
// at 50 and 70 Hz
sample_rate = 1000;
t = 0:1/sample_rate:1
N = size(t,'*'); //number of samples
s = sin(2*%pi*50*t) + sin(2*%pi*70*t+%pi/4) + grand(1,N,'nor',0,1);

y=fft(s);

// s is real so the fft response is conjugate symmetric and we retain only the first N/2 points
f = sample_rate*(0:(N/2))/N; //associated frequency vector
n = size(f,'*')

clf
plot(f, abs(y(1:n)))
