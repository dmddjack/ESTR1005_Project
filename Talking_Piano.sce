clear
cd("D:\user\Documents\CUHK\2021-22 Sem 2\ESTR1005\Project") //local repo address
[audio, fs, bits] = wavread(".\giegie.wav")

t_interval = 0.0714286 // 1/14 seconds
interval = fs * t_interval

f = fs*(1:(interval))/interval
piano_freq = read(".\Piano_Freq.txt",88,1)'
for i = 1: 87
    gmean_piano_freq(i) = sqrt(piano_freq(i + 1) * piano_freq(i))
end
j = 1
for i = 1 : 88
    while f(j) < piano_freq(i)
        j = j + 1
    end
    
    if abs(piano_freq(i)-f(j)) < abs(piano_freq(i)-f(j - 1))
        f_index(i) = j
    else
        f_index(i) = j - 1
    end
end

splitted_piano_fft = zeros(int(size(audio)(2)/(interval)), interval)
for i = 1 : int(size(audio)(2)/(interval))
    splitted_audio(i , :) = (audio(1, (i - 1) * interval + 1 : i * interval) + ..
                            audio(2, (i - 1) * interval + 1 : i * interval)) / 2
    splitted_audio_fft(i , :) = fft(splitted_audio(i , : ))
    k = 1
    for j = 1 : 87
        while f(k) < gmean_piano_freq(j),
            splitted_piano_fft(i , f_index(j)) = ..
            splitted_piano_fft(i , f_index(j)) + splitted_audio_fft(i , k)
            k = k + 1
        end
    end
    for j = 1 : 87
        if abs(splitted_piano_fft(i , f_index(j))) < max(abs(splitted_piano_fft(i , :))) * .2
            splitted_piano_fft(i , f_index(j)) = 0
        end
    end
    
    splitted_piano_fft(i, 2 : interval) = splitted_piano_fft(i, 2 : interval) + ..
                                          conj(flipdim(splitted_piano_fft(i, 2 : interval), 2))
    converted_splitted_piano(i , :) = ifft(splitted_piano_fft(i , :))
end

converted_piano = matrix(converted_splitted_piano', 1, prod(size(converted_splitted_piano)))
wavwrite(converted_piano, 44100, ".\giegie_piano.wav")

playsnd(converted_piano, rate = 44100)
t = linspace(0, size(audio)(2)/fs , size(audio)(2))


clf

for i = 1 : 4 : 16
    subplot(5, 4, i)
    plot(f(1:size(f)(2) * 0.4), real(splitted_audio_fft(i * 25, 1 : size(f)(2) * 0.4)))
    subplot(5, 4, i+1)
    plot(f(1:size(f)(2) * 0.4), imag(splitted_audio_fft(i * 25, 1 : size(f)(2) * 0.4)))
    subplot(5, 4, i+2)
    plot(f(1:size(f)(2) * 0.4), real(splitted_piano_fft(i * 25, 1 : size(f)(2) * 0.4)))
    subplot(5, 4, i+3)
    plot(f(1:size(f)(2) * 0.4), imag(splitted_piano_fft(i * 25, 1 : size(f)(2) * 0.4)))
end
subplot(5, 4, 17)
plot(t, audio)
subplot(5, 4, 18)
plot(t(1:1477350), converted_piano)
//clf
//subplot(5, 2, 9)
//mapsound(Audio,.5,[0,1000],samplingRate = Fs)

