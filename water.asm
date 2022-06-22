const ad REG0
const sum REG5
#maxHeight=10

label saveToRAM
RAM_SAVE ad INPUT 0
ADDi 1 ad ad
IF_LESSii ad 16 saveToRAM

label start



ADDi 0 sum OUTPUT
