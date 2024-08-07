
;	Author:     LG KAKA
.386
.MODEL FLAT ; Flat memory model
.STACK 4096 ; 4096 bytes

INCLUDE io.inc
; Exit function
ExitProcess PROTO NEAR32 stdcall, dwExitCode:DWORD

; The data section stores all global variables
.DATA

sr2 BYTE "Enter the first number",10,0
sr3 BYTE "Enter the second number",10,0
sr4 BYTE 10

num1 DWORD ?
num2 DWORD ?

.CODE
_start:
	INVOKE OutputStr, ADDR sr2
	INVOKE InputInt
	MOV ebx, 100
	CDQ
	DIV ebx
	MOV num1, eax
	
	INVOKE OutputStr, ADDR sr3
	INVOKE InputInt
	MOV ebx, 100
	CDQ
	DIV ebx
	
	ADD eax,num1
	INVOKE OutputInt, eax
	INVOKE OutputStr, ADDR sr4

    

	INVOKE ExitProcess, 0
Public _start
END
