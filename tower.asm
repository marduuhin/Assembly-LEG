const disk_nr REG1
const source REG2
const dest REG3
const spare REG4
const E 5

ADDi 0 INPUT disk_nr
ADDi 0 INPUT source
ADDi 0 INPUT dest
ADDi 0 INPUT spare
CALL 0 0 SaveValues

label move
CALL 0 0 LoadValues
#if disk_nr==0 call SourceToDest
IF_NEQi 0 disk_nr jump1
CALL 0 0 SourceToDest
JUMP 0 0 jump2
label jump1 #IF END#
#ELSE line 1
CALL 0 0 SaveValues
SUBii disk_nr 1 disk_nr
CALL 0 0 SaveValues2
CALL 0 0 move
#ELSE line 2
CALL 0 0 LoadValues
CALL 0 0 SourceToDest
#ELSE line 3
CALL 0 0 SaveValues
SUBii disk_nr 1 disk_nr
CALL 0 0 SaveValues3
CALL 0 0 move
CALL 0 0 LoadValues
label jump2
RET 0 0 0

label SourceToDest #FUNC
ADDi 0 source OUTPUT
ADDii 0 E OUTPUT
ADDi 0 dest OUTPUT
ADDii 0 E OUTPUT
RET 0 0 0

label SaveValues #FUNC
PUSH 0 disk_nr 0
PUSH 0 source 0
PUSH 0 dest 0
PUSH 0 spare 0
RET 0 0 0

label SaveValues2 #FUNC
PUSH 0 disk_nr 0
PUSH 0 source 0
PUSH 0 spare 0
PUSH 0 dest 0
RET 0 0 0

label SaveValues3 #FUNC
PUSH 0 disk_nr 0
PUSH 0 spare 0
PUSH 0 dest 0
PUSH 0 source 0
RET 0 0 0

label LoadValues #FUNC
POP 0 0 spare
POP 0 0 dest
POP 0 0 source
POP 0 0 disk_nr
RET 0 0 0
