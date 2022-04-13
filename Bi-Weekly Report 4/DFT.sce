num_of_f= 10
f_max = 2000 
//warning: increasing this value will increase system memory usage drastically

f_data = gsort(rand(1, num_of_f, "uniform") * f_max, 2, 'i')
amplitude_generator = rand(1, num_of_f, "uniform")
amplitude = diag(amplitude_generator)

t = linspace(0, 1, f_max * 2 + 1)//sampling rate: 4000Hz
f = linspace(0, f_max, f_max * 10 + 1) //max freq: 2000Hz
Y = sum(amplitude*cos(2 * %pi * f_data' * t),1)

EXP_RE =  cos(2 * %pi * f' * t)
EXP_IM = -sin(2 * %pi * f' * t)
DFT_RE = Y * EXP_RE'
DFT_IM = Y * EXP_IM'
DFT_Val = abs(complex(DFT_RE, DFT_IM))

//clf
plot(f,DFT_Val, '.b')
xtitle("Modulus of DFT Data","Frequency","Relative Intensity")

mprintf("list of frequencies:")
disp(f_data)
mprintf("corresponding amplitudes:")
disp(amplitude_generator)
