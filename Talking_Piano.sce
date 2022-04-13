clear
cd("D:\user\Documents\CUHK\2021-22 Sem 2\ESTR1005\Project")
mopen("giegie.wav")
Piano_Freq = read(".\Piano_Freq.txt",88,1)'
[Audio, Fs, bits] = wavread(".\Piano_A2.wav")
t_interval = .5
interval = Fs * t_interval

//t = linspace(0, t_interval, interval)
f = Fs*(0:(interval/2))/interval
//playsnd(Audio, rate = 44100)
for i = 1 : int(size(Audio)(2)/(interval))
    Splitted_Audio(i , :) =  Audio(1, (i - 1) * interval + 1 : i * interval)
    Splitted_Audio_FFT(i , :) = fft(Splitted_Audio(i , : ))
    Converted_Splitted_Audio(i , :) = ifft(Splitted_Audio_FFT(i , :))
end

Converted_Audio = matrix(Converted_Splitted_Audio', 1, prod(size(Converted_Splitted_Audio)))

playsnd(Converted_Audio, rate = 44100)

clf
for i = 1 : 10
    subplot(5, 2, i)
    plot(f(1:size(f)(2) * 0.2), abs(Splitted_Audio_FFT(i , 1 : size(f)(2) * 0.2)))
end

//clf
//subplot(5, 2, 9)
//mapsound(Audio,.5,[0,1000],samplingRate = Fs)

