f1 = 113.7
f2 = 59
t = linspace(0,1,320+1)//sampling rate: 320Hz
Y = cos(2*%pi*f1*t) + cos(2*%pi*f2*t)

//plot(t,y,'-b')
//t = linspace(0,10,100)
//for f = 0:0.1:10
 
for f = 0:0.1:160 //max freq: 160Hz
    EXP_RE = cos(2*%pi*f*t)
    EXP_IM = -sin(2*%pi*f*t)
    DFT_RE = Y*EXP_RE'
    DFT_IM = Y*EXP_IM'
    DFT_Val = norm(complex(DFT_RE,DFT_IM))
    plot(f,DFT_Val, '.-g')
    //plot3d(f,DFT_RE,DFT_IM,'.-b')
end
