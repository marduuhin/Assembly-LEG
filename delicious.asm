const address REG0
const maxAdd REG1
const maxVal REG2
const newAdd REG3
const newVal REG4

label saveall
RAM_SAVE address INPUT 0
ADDi 1 address address
IF_LESSii address 15 saveall
#All values saved in RAM [0-15]

ADDii 0 0 address
label while1 
ADDi 0 address maxAdd
RAM_LOAD address 0 maxVal

ADDii 0 0 newAdd
label while2 #START WH2
#WHILE (newAdd<15) {newAdd++, newVal}
RAM_LOAD newAdd 0 newVal
#IF (newVal>maxVal) {max=new}
IF_LESS_EQ newVal maxVal else
ADDi 0 newVal maxVal
ADDi 0 newAdd maxAdd
label else #IF END
ADDi 1 newAdd newAdd
IF_LESSii newAdd 15 while2 #END WH2

#Add to stack, remove max from RAM
PUSH 0 maxVal 0
RAM_SAVEi maxAdd 0 0

ADDi 1 address address
IF_LESSii address 15 while1 #END WH1

#OUTPUT
label while3
POP 0 0 OUTPUT
SUBii address 1 address
IF_NEQi 0 address while3 #END WH3
