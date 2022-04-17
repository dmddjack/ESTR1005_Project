//clearing workspace variable
clear;

//define input sequence(audio signal)
xn=[1 2 3 4]

//define second sequence (smoothing and gaussian filter)
hn=[1 0]

//length of sequence
L=length(xn);//length of xn
M=length(hn);//length of hn

//zero padding
X = [xn,zeros(1,M)];//pad xn with 2 zeros = [ 1 2 3 4 0 0 ]

//zero padding
H=[hn,zeros(1,L)];//pad hn with 4 zeros = [ 1 0 0 0 0 0 ]

//Main Linear Convolution Loop
for i=1:L+M-1;//Length of the convolution output
    Y(i)=0;//initializing convolution o/p Y=0; 'i' represent the index of convolution o/p Y
    // for to end represent single value convolution loop
    for j=1:L
        if(i-j+1>0)//negative index are avoided in computation
            Y(i)=Y(i)+X(j)*H(i-j+1);
        else
        end
    end
end

Y=Y';

disp(Y);

/*
//scilab function convolution
Yb=conv(xn,hn);

disp(Yb);
*/















