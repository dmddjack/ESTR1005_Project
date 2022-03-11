f_data = gsort(rand(1,10,"uniform")*160,2,'i')
amplitude_generator = rand(1,10,"uniform")
amplitude = diag(amplitude_generator)

t = linspace(0,1,320+1)//sampling rate: 320Hz
f = linspace(0,160,3201) //max freq: 160Hz
Y = sum(amplitude*cos(2*%pi*f_data'*t),1)

EXP_RE =  cos(2*%pi*f'*t)
EXP_IM = -sin(2*%pi*f'*t)
DFT_RE = Y*EXP_RE'
DFT_IM = Y*EXP_IM'
DFT_Val = abs(complex(DFT_RE,DFT_IM))
plot(f,DFT_Val, '.b')
xtitle("Modulus of DFT Data","Frequency","Relative Intensity")
mprintf("list of frequencies:")
disp(f_data)
mprintf("corresponding amplitudes:")
disp(amplitude_generator)

