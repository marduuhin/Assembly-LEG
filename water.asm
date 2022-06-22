const column REG0
const height REG1
const colHeight REG2
const colLeft REG3
const colRight REG4
const sum REG5
#maxHeight=10 [1-10] {2-6}
#maxColumn=16 [0-15]

label saveToRAM
RAM_SAVE column INPUT 0
ADDi 1 column column
IF_LESSii column 16 saveToRAM

ADDii 1 0 height
label start
ADDi 1 height height

#find the leftmost column @height
ADDii 0 0 column
ADDii 15 0 colLeft
label LefCol
RAM_LOAD column 0 colHeight
IF_MORE_EQ colHeight height LefColB
ADDi 1 column column
IF_LESSii column 16 LefCol
JUMP 0 0 LefColEnd
label LefColB
ADDi 0 column colLeft
label LefColEnd

#find the rightmost column @height
ADDii 15 0 column
ADDii 0 0 colRight
label RigCol
RAM_LOAD column 0 colHeight
IF_MORE_EQ colHeight height RigColB
SUBii column 1 column
IF_NEQi 255 column RigCol
JUMP 0 0 RigColEnd
label RigColB
ADDi 0 column colRight
label RigColEnd

#Skip water calc if nonsense
IF_MORE_EQ colLeft colRight waterEnd

#Calculate amount of water between columns
ADDi 1 colLeft column
label water
RAM_LOAD column 0 colHeight
IF_MORE_EQ colHeight height nochange
ADDi 1 sum sum
label nochange
ADDi 1 column column
IF_MORE_EQ column colRight waterEnd
JUMP 0 0 water
label waterEnd

IF_LESSii height 6 start

ADDi 0 sum OUTPUT
