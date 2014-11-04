
;CodeVisionAVR C Compiler V2.05.3 Standard
;(C) Copyright 1998-2011 Pavel Haiduc, HP InfoTech s.r.l.
;http://www.hpinfotech.com

;Chip type                : ATmega8535
;Program type             : Application
;Clock frequency          : 4,000000 MHz
;Memory model             : Small
;Optimize for             : Size
;(s)printf features       : int, width
;(s)scanf features        : int, width
;External RAM size        : 0
;Data Stack size          : 128 byte(s)
;Heap size                : 0 byte(s)
;Promote 'char' to 'int'  : Yes
;'char' is unsigned       : Yes
;8 bit enums              : Yes
;Global 'const' stored in FLASH     : No
;Enhanced function parameter passing: Yes
;Enhanced core instructions         : On
;Smart register allocation          : On
;Automatic register allocation      : On

	#pragma AVRPART ADMIN PART_NAME ATmega8535
	#pragma AVRPART MEMORY PROG_FLASH 8192
	#pragma AVRPART MEMORY EEPROM 512
	#pragma AVRPART MEMORY INT_SRAM SIZE 607
	#pragma AVRPART MEMORY INT_SRAM START_ADDR 0x60

	.LISTMAC
	.EQU UDRE=0x5
	.EQU RXC=0x7
	.EQU USR=0xB
	.EQU UDR=0xC
	.EQU SPSR=0xE
	.EQU SPDR=0xF
	.EQU EERE=0x0
	.EQU EEWE=0x1
	.EQU EEMWE=0x2
	.EQU EECR=0x1C
	.EQU EEDR=0x1D
	.EQU EEARL=0x1E
	.EQU EEARH=0x1F
	.EQU WDTCR=0x21
	.EQU MCUCR=0x35
	.EQU GICR=0x3B
	.EQU SPL=0x3D
	.EQU SPH=0x3E
	.EQU SREG=0x3F

	.DEF R0X0=R0
	.DEF R0X1=R1
	.DEF R0X2=R2
	.DEF R0X3=R3
	.DEF R0X4=R4
	.DEF R0X5=R5
	.DEF R0X6=R6
	.DEF R0X7=R7
	.DEF R0X8=R8
	.DEF R0X9=R9
	.DEF R0XA=R10
	.DEF R0XB=R11
	.DEF R0XC=R12
	.DEF R0XD=R13
	.DEF R0XE=R14
	.DEF R0XF=R15
	.DEF R0X10=R16
	.DEF R0X11=R17
	.DEF R0X12=R18
	.DEF R0X13=R19
	.DEF R0X14=R20
	.DEF R0X15=R21
	.DEF R0X16=R22
	.DEF R0X17=R23
	.DEF R0X18=R24
	.DEF R0X19=R25
	.DEF R0X1A=R26
	.DEF R0X1B=R27
	.DEF R0X1C=R28
	.DEF R0X1D=R29
	.DEF R0X1E=R30
	.DEF R0X1F=R31

	.EQU __SRAM_START=0x0060
	.EQU __SRAM_END=0x025F
	.EQU __DSTACK_SIZE=0x0080
	.EQU __HEAP_SIZE=0x0000
	.EQU __CLEAR_SRAM_SIZE=__SRAM_END-__SRAM_START+1

	.MACRO __CPD1N
	CPI  R30,LOW(@0)
	LDI  R26,HIGH(@0)
	CPC  R31,R26
	LDI  R26,BYTE3(@0)
	CPC  R22,R26
	LDI  R26,BYTE4(@0)
	CPC  R23,R26
	.ENDM

	.MACRO __CPD2N
	CPI  R26,LOW(@0)
	LDI  R30,HIGH(@0)
	CPC  R27,R30
	LDI  R30,BYTE3(@0)
	CPC  R24,R30
	LDI  R30,BYTE4(@0)
	CPC  R25,R30
	.ENDM

	.MACRO __CPWRR
	CP   R@0,R@2
	CPC  R@1,R@3
	.ENDM

	.MACRO __CPWRN
	CPI  R@0,LOW(@2)
	LDI  R30,HIGH(@2)
	CPC  R@1,R30
	.ENDM

	.MACRO __ADDB1MN
	SUBI R30,LOW(-@0-(@1))
	.ENDM

	.MACRO __ADDB2MN
	SUBI R26,LOW(-@0-(@1))
	.ENDM

	.MACRO __ADDW1MN
	SUBI R30,LOW(-@0-(@1))
	SBCI R31,HIGH(-@0-(@1))
	.ENDM

	.MACRO __ADDW2MN
	SUBI R26,LOW(-@0-(@1))
	SBCI R27,HIGH(-@0-(@1))
	.ENDM

	.MACRO __ADDW1FN
	SUBI R30,LOW(-2*@0-(@1))
	SBCI R31,HIGH(-2*@0-(@1))
	.ENDM

	.MACRO __ADDD1FN
	SUBI R30,LOW(-2*@0-(@1))
	SBCI R31,HIGH(-2*@0-(@1))
	SBCI R22,BYTE3(-2*@0-(@1))
	.ENDM

	.MACRO __ADDD1N
	SUBI R30,LOW(-@0)
	SBCI R31,HIGH(-@0)
	SBCI R22,BYTE3(-@0)
	SBCI R23,BYTE4(-@0)
	.ENDM

	.MACRO __ADDD2N
	SUBI R26,LOW(-@0)
	SBCI R27,HIGH(-@0)
	SBCI R24,BYTE3(-@0)
	SBCI R25,BYTE4(-@0)
	.ENDM

	.MACRO __SUBD1N
	SUBI R30,LOW(@0)
	SBCI R31,HIGH(@0)
	SBCI R22,BYTE3(@0)
	SBCI R23,BYTE4(@0)
	.ENDM

	.MACRO __SUBD2N
	SUBI R26,LOW(@0)
	SBCI R27,HIGH(@0)
	SBCI R24,BYTE3(@0)
	SBCI R25,BYTE4(@0)
	.ENDM

	.MACRO __ANDBMNN
	LDS  R30,@0+(@1)
	ANDI R30,LOW(@2)
	STS  @0+(@1),R30
	.ENDM

	.MACRO __ANDWMNN
	LDS  R30,@0+(@1)
	ANDI R30,LOW(@2)
	STS  @0+(@1),R30
	LDS  R30,@0+(@1)+1
	ANDI R30,HIGH(@2)
	STS  @0+(@1)+1,R30
	.ENDM

	.MACRO __ANDD1N
	ANDI R30,LOW(@0)
	ANDI R31,HIGH(@0)
	ANDI R22,BYTE3(@0)
	ANDI R23,BYTE4(@0)
	.ENDM

	.MACRO __ANDD2N
	ANDI R26,LOW(@0)
	ANDI R27,HIGH(@0)
	ANDI R24,BYTE3(@0)
	ANDI R25,BYTE4(@0)
	.ENDM

	.MACRO __ORBMNN
	LDS  R30,@0+(@1)
	ORI  R30,LOW(@2)
	STS  @0+(@1),R30
	.ENDM

	.MACRO __ORWMNN
	LDS  R30,@0+(@1)
	ORI  R30,LOW(@2)
	STS  @0+(@1),R30
	LDS  R30,@0+(@1)+1
	ORI  R30,HIGH(@2)
	STS  @0+(@1)+1,R30
	.ENDM

	.MACRO __ORD1N
	ORI  R30,LOW(@0)
	ORI  R31,HIGH(@0)
	ORI  R22,BYTE3(@0)
	ORI  R23,BYTE4(@0)
	.ENDM

	.MACRO __ORD2N
	ORI  R26,LOW(@0)
	ORI  R27,HIGH(@0)
	ORI  R24,BYTE3(@0)
	ORI  R25,BYTE4(@0)
	.ENDM

	.MACRO __DELAY_USB
	LDI  R24,LOW(@0)
__DELAY_USB_LOOP:
	DEC  R24
	BRNE __DELAY_USB_LOOP
	.ENDM

	.MACRO __DELAY_USW
	LDI  R24,LOW(@0)
	LDI  R25,HIGH(@0)
__DELAY_USW_LOOP:
	SBIW R24,1
	BRNE __DELAY_USW_LOOP
	.ENDM

	.MACRO __GETD1S
	LDD  R30,Y+@0
	LDD  R31,Y+@0+1
	LDD  R22,Y+@0+2
	LDD  R23,Y+@0+3
	.ENDM

	.MACRO __GETD2S
	LDD  R26,Y+@0
	LDD  R27,Y+@0+1
	LDD  R24,Y+@0+2
	LDD  R25,Y+@0+3
	.ENDM

	.MACRO __PUTD1S
	STD  Y+@0,R30
	STD  Y+@0+1,R31
	STD  Y+@0+2,R22
	STD  Y+@0+3,R23
	.ENDM

	.MACRO __PUTD2S
	STD  Y+@0,R26
	STD  Y+@0+1,R27
	STD  Y+@0+2,R24
	STD  Y+@0+3,R25
	.ENDM

	.MACRO __PUTDZ2
	STD  Z+@0,R26
	STD  Z+@0+1,R27
	STD  Z+@0+2,R24
	STD  Z+@0+3,R25
	.ENDM

	.MACRO __CLRD1S
	STD  Y+@0,R30
	STD  Y+@0+1,R30
	STD  Y+@0+2,R30
	STD  Y+@0+3,R30
	.ENDM

	.MACRO __POINTB1MN
	LDI  R30,LOW(@0+(@1))
	.ENDM

	.MACRO __POINTW1MN
	LDI  R30,LOW(@0+(@1))
	LDI  R31,HIGH(@0+(@1))
	.ENDM

	.MACRO __POINTD1M
	LDI  R30,LOW(@0)
	LDI  R31,HIGH(@0)
	LDI  R22,BYTE3(@0)
	LDI  R23,BYTE4(@0)
	.ENDM

	.MACRO __POINTW1FN
	LDI  R30,LOW(2*@0+(@1))
	LDI  R31,HIGH(2*@0+(@1))
	.ENDM

	.MACRO __POINTD1FN
	LDI  R30,LOW(2*@0+(@1))
	LDI  R31,HIGH(2*@0+(@1))
	LDI  R22,BYTE3(2*@0+(@1))
	LDI  R23,BYTE4(2*@0+(@1))
	.ENDM

	.MACRO __POINTB2MN
	LDI  R26,LOW(@0+(@1))
	.ENDM

	.MACRO __POINTW2MN
	LDI  R26,LOW(@0+(@1))
	LDI  R27,HIGH(@0+(@1))
	.ENDM

	.MACRO __POINTW2FN
	LDI  R26,LOW(2*@0+(@1))
	LDI  R27,HIGH(2*@0+(@1))
	.ENDM

	.MACRO __POINTD2FN
	LDI  R26,LOW(2*@0+(@1))
	LDI  R27,HIGH(2*@0+(@1))
	LDI  R24,BYTE3(2*@0+(@1))
	LDI  R25,BYTE4(2*@0+(@1))
	.ENDM

	.MACRO __POINTBRM
	LDI  R@0,LOW(@1)
	.ENDM

	.MACRO __POINTWRM
	LDI  R@0,LOW(@2)
	LDI  R@1,HIGH(@2)
	.ENDM

	.MACRO __POINTBRMN
	LDI  R@0,LOW(@1+(@2))
	.ENDM

	.MACRO __POINTWRMN
	LDI  R@0,LOW(@2+(@3))
	LDI  R@1,HIGH(@2+(@3))
	.ENDM

	.MACRO __POINTWRFN
	LDI  R@0,LOW(@2*2+(@3))
	LDI  R@1,HIGH(@2*2+(@3))
	.ENDM

	.MACRO __GETD1N
	LDI  R30,LOW(@0)
	LDI  R31,HIGH(@0)
	LDI  R22,BYTE3(@0)
	LDI  R23,BYTE4(@0)
	.ENDM

	.MACRO __GETD2N
	LDI  R26,LOW(@0)
	LDI  R27,HIGH(@0)
	LDI  R24,BYTE3(@0)
	LDI  R25,BYTE4(@0)
	.ENDM

	.MACRO __GETB1MN
	LDS  R30,@0+(@1)
	.ENDM

	.MACRO __GETB1HMN
	LDS  R31,@0+(@1)
	.ENDM

	.MACRO __GETW1MN
	LDS  R30,@0+(@1)
	LDS  R31,@0+(@1)+1
	.ENDM

	.MACRO __GETD1MN
	LDS  R30,@0+(@1)
	LDS  R31,@0+(@1)+1
	LDS  R22,@0+(@1)+2
	LDS  R23,@0+(@1)+3
	.ENDM

	.MACRO __GETBRMN
	LDS  R@0,@1+(@2)
	.ENDM

	.MACRO __GETWRMN
	LDS  R@0,@2+(@3)
	LDS  R@1,@2+(@3)+1
	.ENDM

	.MACRO __GETWRZ
	LDD  R@0,Z+@2
	LDD  R@1,Z+@2+1
	.ENDM

	.MACRO __GETD2Z
	LDD  R26,Z+@0
	LDD  R27,Z+@0+1
	LDD  R24,Z+@0+2
	LDD  R25,Z+@0+3
	.ENDM

	.MACRO __GETB2MN
	LDS  R26,@0+(@1)
	.ENDM

	.MACRO __GETW2MN
	LDS  R26,@0+(@1)
	LDS  R27,@0+(@1)+1
	.ENDM

	.MACRO __GETD2MN
	LDS  R26,@0+(@1)
	LDS  R27,@0+(@1)+1
	LDS  R24,@0+(@1)+2
	LDS  R25,@0+(@1)+3
	.ENDM

	.MACRO __PUTB1MN
	STS  @0+(@1),R30
	.ENDM

	.MACRO __PUTW1MN
	STS  @0+(@1),R30
	STS  @0+(@1)+1,R31
	.ENDM

	.MACRO __PUTD1MN
	STS  @0+(@1),R30
	STS  @0+(@1)+1,R31
	STS  @0+(@1)+2,R22
	STS  @0+(@1)+3,R23
	.ENDM

	.MACRO __PUTB1EN
	LDI  R26,LOW(@0+(@1))
	LDI  R27,HIGH(@0+(@1))
	RCALL __EEPROMWRB
	.ENDM

	.MACRO __PUTW1EN
	LDI  R26,LOW(@0+(@1))
	LDI  R27,HIGH(@0+(@1))
	RCALL __EEPROMWRW
	.ENDM

	.MACRO __PUTD1EN
	LDI  R26,LOW(@0+(@1))
	LDI  R27,HIGH(@0+(@1))
	RCALL __EEPROMWRD
	.ENDM

	.MACRO __PUTBR0MN
	STS  @0+(@1),R0
	.ENDM

	.MACRO __PUTBMRN
	STS  @0+(@1),R@2
	.ENDM

	.MACRO __PUTWMRN
	STS  @0+(@1),R@2
	STS  @0+(@1)+1,R@3
	.ENDM

	.MACRO __PUTBZR
	STD  Z+@1,R@0
	.ENDM

	.MACRO __PUTWZR
	STD  Z+@2,R@0
	STD  Z+@2+1,R@1
	.ENDM

	.MACRO __GETW1R
	MOV  R30,R@0
	MOV  R31,R@1
	.ENDM

	.MACRO __GETW2R
	MOV  R26,R@0
	MOV  R27,R@1
	.ENDM

	.MACRO __GETWRN
	LDI  R@0,LOW(@2)
	LDI  R@1,HIGH(@2)
	.ENDM

	.MACRO __PUTW1R
	MOV  R@0,R30
	MOV  R@1,R31
	.ENDM

	.MACRO __PUTW2R
	MOV  R@0,R26
	MOV  R@1,R27
	.ENDM

	.MACRO __ADDWRN
	SUBI R@0,LOW(-@2)
	SBCI R@1,HIGH(-@2)
	.ENDM

	.MACRO __ADDWRR
	ADD  R@0,R@2
	ADC  R@1,R@3
	.ENDM

	.MACRO __SUBWRN
	SUBI R@0,LOW(@2)
	SBCI R@1,HIGH(@2)
	.ENDM

	.MACRO __SUBWRR
	SUB  R@0,R@2
	SBC  R@1,R@3
	.ENDM

	.MACRO __ANDWRN
	ANDI R@0,LOW(@2)
	ANDI R@1,HIGH(@2)
	.ENDM

	.MACRO __ANDWRR
	AND  R@0,R@2
	AND  R@1,R@3
	.ENDM

	.MACRO __ORWRN
	ORI  R@0,LOW(@2)
	ORI  R@1,HIGH(@2)
	.ENDM

	.MACRO __ORWRR
	OR   R@0,R@2
	OR   R@1,R@3
	.ENDM

	.MACRO __EORWRR
	EOR  R@0,R@2
	EOR  R@1,R@3
	.ENDM

	.MACRO __GETWRS
	LDD  R@0,Y+@2
	LDD  R@1,Y+@2+1
	.ENDM

	.MACRO __PUTBSR
	STD  Y+@1,R@0
	.ENDM

	.MACRO __PUTWSR
	STD  Y+@2,R@0
	STD  Y+@2+1,R@1
	.ENDM

	.MACRO __MOVEWRR
	MOV  R@0,R@2
	MOV  R@1,R@3
	.ENDM

	.MACRO __INWR
	IN   R@0,@2
	IN   R@1,@2+1
	.ENDM

	.MACRO __OUTWR
	OUT  @2+1,R@1
	OUT  @2,R@0
	.ENDM

	.MACRO __CALL1MN
	LDS  R30,@0+(@1)
	LDS  R31,@0+(@1)+1
	ICALL
	.ENDM

	.MACRO __CALL1FN
	LDI  R30,LOW(2*@0+(@1))
	LDI  R31,HIGH(2*@0+(@1))
	RCALL __GETW1PF
	ICALL
	.ENDM

	.MACRO __CALL2EN
	LDI  R26,LOW(@0+(@1))
	LDI  R27,HIGH(@0+(@1))
	RCALL __EEPROMRDW
	ICALL
	.ENDM

	.MACRO __GETW1STACK
	IN   R26,SPL
	IN   R27,SPH
	ADIW R26,@0+1
	LD   R30,X+
	LD   R31,X
	.ENDM

	.MACRO __GETD1STACK
	IN   R26,SPL
	IN   R27,SPH
	ADIW R26,@0+1
	LD   R30,X+
	LD   R31,X+
	LD   R22,X
	.ENDM

	.MACRO __NBST
	BST  R@0,@1
	IN   R30,SREG
	LDI  R31,0x40
	EOR  R30,R31
	OUT  SREG,R30
	.ENDM


	.MACRO __PUTB1SN
	LDD  R26,Y+@0
	LDD  R27,Y+@0+1
	SUBI R26,LOW(-@1)
	SBCI R27,HIGH(-@1)
	ST   X,R30
	.ENDM

	.MACRO __PUTW1SN
	LDD  R26,Y+@0
	LDD  R27,Y+@0+1
	SUBI R26,LOW(-@1)
	SBCI R27,HIGH(-@1)
	ST   X+,R30
	ST   X,R31
	.ENDM

	.MACRO __PUTD1SN
	LDD  R26,Y+@0
	LDD  R27,Y+@0+1
	SUBI R26,LOW(-@1)
	SBCI R27,HIGH(-@1)
	RCALL __PUTDP1
	.ENDM

	.MACRO __PUTB1SNS
	LDD  R26,Y+@0
	LDD  R27,Y+@0+1
	ADIW R26,@1
	ST   X,R30
	.ENDM

	.MACRO __PUTW1SNS
	LDD  R26,Y+@0
	LDD  R27,Y+@0+1
	ADIW R26,@1
	ST   X+,R30
	ST   X,R31
	.ENDM

	.MACRO __PUTD1SNS
	LDD  R26,Y+@0
	LDD  R27,Y+@0+1
	ADIW R26,@1
	RCALL __PUTDP1
	.ENDM

	.MACRO __PUTB1PMN
	LDS  R26,@0
	LDS  R27,@0+1
	SUBI R26,LOW(-@1)
	SBCI R27,HIGH(-@1)
	ST   X,R30
	.ENDM

	.MACRO __PUTW1PMN
	LDS  R26,@0
	LDS  R27,@0+1
	SUBI R26,LOW(-@1)
	SBCI R27,HIGH(-@1)
	ST   X+,R30
	ST   X,R31
	.ENDM

	.MACRO __PUTD1PMN
	LDS  R26,@0
	LDS  R27,@0+1
	SUBI R26,LOW(-@1)
	SBCI R27,HIGH(-@1)
	RCALL __PUTDP1
	.ENDM

	.MACRO __PUTB1PMNS
	LDS  R26,@0
	LDS  R27,@0+1
	ADIW R26,@1
	ST   X,R30
	.ENDM

	.MACRO __PUTW1PMNS
	LDS  R26,@0
	LDS  R27,@0+1
	ADIW R26,@1
	ST   X+,R30
	ST   X,R31
	.ENDM

	.MACRO __PUTD1PMNS
	LDS  R26,@0
	LDS  R27,@0+1
	ADIW R26,@1
	RCALL __PUTDP1
	.ENDM

	.MACRO __PUTB1RN
	MOVW R26,R@0
	SUBI R26,LOW(-@1)
	SBCI R27,HIGH(-@1)
	ST   X,R30
	.ENDM

	.MACRO __PUTW1RN
	MOVW R26,R@0
	SUBI R26,LOW(-@1)
	SBCI R27,HIGH(-@1)
	ST   X+,R30
	ST   X,R31
	.ENDM

	.MACRO __PUTD1RN
	MOVW R26,R@0
	SUBI R26,LOW(-@1)
	SBCI R27,HIGH(-@1)
	RCALL __PUTDP1
	.ENDM

	.MACRO __PUTB1RNS
	MOVW R26,R@0
	ADIW R26,@1
	ST   X,R30
	.ENDM

	.MACRO __PUTW1RNS
	MOVW R26,R@0
	ADIW R26,@1
	ST   X+,R30
	ST   X,R31
	.ENDM

	.MACRO __PUTD1RNS
	MOVW R26,R@0
	ADIW R26,@1
	RCALL __PUTDP1
	.ENDM

	.MACRO __PUTB1RON
	MOV  R26,R@0
	MOV  R27,R@1
	SUBI R26,LOW(-@2)
	SBCI R27,HIGH(-@2)
	ST   X,R30
	.ENDM

	.MACRO __PUTW1RON
	MOV  R26,R@0
	MOV  R27,R@1
	SUBI R26,LOW(-@2)
	SBCI R27,HIGH(-@2)
	ST   X+,R30
	ST   X,R31
	.ENDM

	.MACRO __PUTD1RON
	MOV  R26,R@0
	MOV  R27,R@1
	SUBI R26,LOW(-@2)
	SBCI R27,HIGH(-@2)
	RCALL __PUTDP1
	.ENDM

	.MACRO __PUTB1RONS
	MOV  R26,R@0
	MOV  R27,R@1
	ADIW R26,@2
	ST   X,R30
	.ENDM

	.MACRO __PUTW1RONS
	MOV  R26,R@0
	MOV  R27,R@1
	ADIW R26,@2
	ST   X+,R30
	ST   X,R31
	.ENDM

	.MACRO __PUTD1RONS
	MOV  R26,R@0
	MOV  R27,R@1
	ADIW R26,@2
	RCALL __PUTDP1
	.ENDM


	.MACRO __GETB1SX
	MOVW R30,R28
	SUBI R30,LOW(-@0)
	SBCI R31,HIGH(-@0)
	LD   R30,Z
	.ENDM

	.MACRO __GETB1HSX
	MOVW R30,R28
	SUBI R30,LOW(-@0)
	SBCI R31,HIGH(-@0)
	LD   R31,Z
	.ENDM

	.MACRO __GETW1SX
	MOVW R30,R28
	SUBI R30,LOW(-@0)
	SBCI R31,HIGH(-@0)
	LD   R0,Z+
	LD   R31,Z
	MOV  R30,R0
	.ENDM

	.MACRO __GETD1SX
	MOVW R30,R28
	SUBI R30,LOW(-@0)
	SBCI R31,HIGH(-@0)
	LD   R0,Z+
	LD   R1,Z+
	LD   R22,Z+
	LD   R23,Z
	MOVW R30,R0
	.ENDM

	.MACRO __GETB2SX
	MOVW R26,R28
	SUBI R26,LOW(-@0)
	SBCI R27,HIGH(-@0)
	LD   R26,X
	.ENDM

	.MACRO __GETW2SX
	MOVW R26,R28
	SUBI R26,LOW(-@0)
	SBCI R27,HIGH(-@0)
	LD   R0,X+
	LD   R27,X
	MOV  R26,R0
	.ENDM

	.MACRO __GETD2SX
	MOVW R26,R28
	SUBI R26,LOW(-@0)
	SBCI R27,HIGH(-@0)
	LD   R0,X+
	LD   R1,X+
	LD   R24,X+
	LD   R25,X
	MOVW R26,R0
	.ENDM

	.MACRO __GETBRSX
	MOVW R30,R28
	SUBI R30,LOW(-@1)
	SBCI R31,HIGH(-@1)
	LD   R@0,Z
	.ENDM

	.MACRO __GETWRSX
	MOVW R30,R28
	SUBI R30,LOW(-@2)
	SBCI R31,HIGH(-@2)
	LD   R@0,Z+
	LD   R@1,Z
	.ENDM

	.MACRO __GETBRSX2
	MOVW R26,R28
	SUBI R26,LOW(-@1)
	SBCI R27,HIGH(-@1)
	LD   R@0,X
	.ENDM

	.MACRO __GETWRSX2
	MOVW R26,R28
	SUBI R26,LOW(-@2)
	SBCI R27,HIGH(-@2)
	LD   R@0,X+
	LD   R@1,X
	.ENDM

	.MACRO __LSLW8SX
	MOVW R30,R28
	SUBI R30,LOW(-@0)
	SBCI R31,HIGH(-@0)
	LD   R31,Z
	CLR  R30
	.ENDM

	.MACRO __PUTB1SX
	MOVW R26,R28
	SUBI R26,LOW(-@0)
	SBCI R27,HIGH(-@0)
	ST   X,R30
	.ENDM

	.MACRO __PUTW1SX
	MOVW R26,R28
	SUBI R26,LOW(-@0)
	SBCI R27,HIGH(-@0)
	ST   X+,R30
	ST   X,R31
	.ENDM

	.MACRO __PUTD1SX
	MOVW R26,R28
	SUBI R26,LOW(-@0)
	SBCI R27,HIGH(-@0)
	ST   X+,R30
	ST   X+,R31
	ST   X+,R22
	ST   X,R23
	.ENDM

	.MACRO __CLRW1SX
	MOVW R26,R28
	SUBI R26,LOW(-@0)
	SBCI R27,HIGH(-@0)
	ST   X+,R30
	ST   X,R30
	.ENDM

	.MACRO __CLRD1SX
	MOVW R26,R28
	SUBI R26,LOW(-@0)
	SBCI R27,HIGH(-@0)
	ST   X+,R30
	ST   X+,R30
	ST   X+,R30
	ST   X,R30
	.ENDM

	.MACRO __PUTB2SX
	MOVW R30,R28
	SUBI R30,LOW(-@0)
	SBCI R31,HIGH(-@0)
	ST   Z,R26
	.ENDM

	.MACRO __PUTW2SX
	MOVW R30,R28
	SUBI R30,LOW(-@0)
	SBCI R31,HIGH(-@0)
	ST   Z+,R26
	ST   Z,R27
	.ENDM

	.MACRO __PUTD2SX
	MOVW R30,R28
	SUBI R30,LOW(-@0)
	SBCI R31,HIGH(-@0)
	ST   Z+,R26
	ST   Z+,R27
	ST   Z+,R24
	ST   Z,R25
	.ENDM

	.MACRO __PUTBSRX
	MOVW R30,R28
	SUBI R30,LOW(-@1)
	SBCI R31,HIGH(-@1)
	ST   Z,R@0
	.ENDM

	.MACRO __PUTWSRX
	MOVW R30,R28
	SUBI R30,LOW(-@2)
	SBCI R31,HIGH(-@2)
	ST   Z+,R@0
	ST   Z,R@1
	.ENDM

	.MACRO __PUTB1SNX
	MOVW R26,R28
	SUBI R26,LOW(-@0)
	SBCI R27,HIGH(-@0)
	LD   R0,X+
	LD   R27,X
	MOV  R26,R0
	SUBI R26,LOW(-@1)
	SBCI R27,HIGH(-@1)
	ST   X,R30
	.ENDM

	.MACRO __PUTW1SNX
	MOVW R26,R28
	SUBI R26,LOW(-@0)
	SBCI R27,HIGH(-@0)
	LD   R0,X+
	LD   R27,X
	MOV  R26,R0
	SUBI R26,LOW(-@1)
	SBCI R27,HIGH(-@1)
	ST   X+,R30
	ST   X,R31
	.ENDM

	.MACRO __PUTD1SNX
	MOVW R26,R28
	SUBI R26,LOW(-@0)
	SBCI R27,HIGH(-@0)
	LD   R0,X+
	LD   R27,X
	MOV  R26,R0
	SUBI R26,LOW(-@1)
	SBCI R27,HIGH(-@1)
	ST   X+,R30
	ST   X+,R31
	ST   X+,R22
	ST   X,R23
	.ENDM

	.MACRO __MULBRR
	MULS R@0,R@1
	MOVW R30,R0
	.ENDM

	.MACRO __MULBRRU
	MUL  R@0,R@1
	MOVW R30,R0
	.ENDM

	.MACRO __MULBRR0
	MULS R@0,R@1
	.ENDM

	.MACRO __MULBRRU0
	MUL  R@0,R@1
	.ENDM

	.MACRO __MULBNWRU
	LDI  R26,@2
	MUL  R26,R@0
	MOVW R30,R0
	MUL  R26,R@1
	ADD  R31,R0
	.ENDM

;NAME DEFINITIONS FOR GLOBAL VARIABLES ALLOCATED TO REGISTERS
	.DEF _enc_ka=R4
	.DEF _enc_ki=R6
	.DEF _rec_ki=R8
	.DEF _rec_ka=R10
	.DEF _timer=R12

	.CSEG
	.ORG 0x00

;START OF CODE MARKER
__START_OF_CODE:

;INTERRUPT VECTORS
	RJMP __RESET
	RJMP _ext_int0_isr
	RJMP _ext_int1_isr
	RJMP 0x00
	RJMP 0x00
	RJMP 0x00
	RJMP 0x00
	RJMP 0x00
	RJMP 0x00
	RJMP _timer0_ovf_isr
	RJMP 0x00
	RJMP _usart_rx_isr
	RJMP 0x00
	RJMP _usart_tx_isr
	RJMP 0x00
	RJMP 0x00
	RJMP 0x00
	RJMP 0x00
	RJMP 0x00
	RJMP 0x00
	RJMP 0x00

_tbl10_G101:
	.DB  0x10,0x27,0xE8,0x3,0x64,0x0,0xA,0x0
	.DB  0x1,0x0
_tbl16_G101:
	.DB  0x0,0x10,0x0,0x1,0x10,0x0,0x1,0x0

;REGISTER BIT VARIABLES INITIALIZATION
__REG_BIT_VARS:
	.DW  0x0000

_0x0:
	.DB  0x25,0x64,0x20,0x25,0x64,0x0,0x74,0x75
	.DB  0x6E,0x67,0x67,0x75,0x20,0x70,0x65,0x72
	.DB  0x69,0x6E,0x74,0x61,0x68,0x0,0x30,0x0
	.DB  0x31,0x0,0x32,0x0,0x73,0x61,0x6D,0x70
	.DB  0x61,0x69,0x0
_0x2000003:
	.DB  0x80,0xC0

__GLOBAL_INI_TBL:
	.DW  0x01
	.DW  0x02
	.DW  __REG_BIT_VARS*2

	.DW  0x02
	.DW  __base_y_G100
	.DW  _0x2000003*2

_0xFFFFFFFF:
	.DW  0

__RESET:
	CLI
	CLR  R30
	OUT  EECR,R30

;INTERRUPT VECTORS ARE PLACED
;AT THE START OF FLASH
	LDI  R31,1
	OUT  GICR,R31
	OUT  GICR,R30
	OUT  MCUCR,R30

;DISABLE WATCHDOG
	LDI  R31,0x18
	OUT  WDTCR,R31
	OUT  WDTCR,R30

;CLEAR R2-R14
	LDI  R24,(14-2)+1
	LDI  R26,2
	CLR  R27
__CLEAR_REG:
	ST   X+,R30
	DEC  R24
	BRNE __CLEAR_REG

;CLEAR SRAM
	LDI  R24,LOW(__CLEAR_SRAM_SIZE)
	LDI  R25,HIGH(__CLEAR_SRAM_SIZE)
	LDI  R26,__SRAM_START
__CLEAR_SRAM:
	ST   X+,R30
	SBIW R24,1
	BRNE __CLEAR_SRAM

;GLOBAL VARIABLES INITIALIZATION
	LDI  R30,LOW(__GLOBAL_INI_TBL*2)
	LDI  R31,HIGH(__GLOBAL_INI_TBL*2)
__GLOBAL_INI_NEXT:
	LPM  R24,Z+
	LPM  R25,Z+
	SBIW R24,0
	BREQ __GLOBAL_INI_END
	LPM  R26,Z+
	LPM  R27,Z+
	LPM  R0,Z+
	LPM  R1,Z+
	MOVW R22,R30
	MOVW R30,R0
__GLOBAL_INI_LOOP:
	LPM  R0,Z+
	ST   X+,R0
	SBIW R24,1
	BRNE __GLOBAL_INI_LOOP
	MOVW R30,R22
	RJMP __GLOBAL_INI_NEXT
__GLOBAL_INI_END:

;HARDWARE STACK POINTER INITIALIZATION
	LDI  R30,LOW(__SRAM_END-__HEAP_SIZE)
	OUT  SPL,R30
	LDI  R30,HIGH(__SRAM_END-__HEAP_SIZE)
	OUT  SPH,R30

;DATA STACK POINTER INITIALIZATION
	LDI  R28,LOW(__SRAM_START+__DSTACK_SIZE)
	LDI  R29,HIGH(__SRAM_START+__DSTACK_SIZE)

	RJMP _main

	.ESEG
	.ORG 0

	.DSEG
	.ORG 0xE0

	.CSEG
;/*****************************************************
;This program was produced by the
;CodeWizardAVR V2.05.3 Standard
;Automatic Program Generator
;© Copyright 1998-2011 Pavel Haiduc, HP InfoTech s.r.l.
;http://www.hpinfotech.com
;
;Project :
;Version :
;Date    : 12/14/2012
;Author  : PerTic@n
;Company : If You Like This Software,Buy It
;Comments:
;
;
;Chip type               : ATmega8535
;Program type            : Application
;AVR Core Clock frequency: 4.000000 MHz
;Memory model            : Small
;External RAM size       : 0
;Data Stack size         : 128
;*****************************************************/
;
;#include <mega8535.h>
	#ifndef __SLEEP_DEFINED__
	#define __SLEEP_DEFINED__
	.EQU __se_bit=0x40
	.EQU __sm_mask=0xB0
	.EQU __sm_powerdown=0x20
	.EQU __sm_powersave=0x30
	.EQU __sm_standby=0xA0
	.EQU __sm_ext_standby=0xB0
	.EQU __sm_adc_noise_red=0x10
	.SET power_ctrl_reg=mcucr
	#endif
;
;
;#include <delay.h>
;
;// Alphanumeric LCD functions
;#include <alcd.h>
;  int enc_ka, enc_ki,rec_ki,rec_ka;
;     unsigned char buff[33];
;     int timer,timerec;
;// External Interrupt 0 service routine
;interrupt [EXT_INT0] void ext_int0_isr(void)
; 0000 0024 {

	.CSEG
_ext_int0_isr:
	RCALL SUBOPT_0x0
; 0000 0025 enc_ki++;
	MOVW R30,R6
	ADIW R30,1
	MOVW R6,R30
; 0000 0026 
; 0000 0027 }
	RJMP _0x49
;
;// External Interrupt 1 service routine
;interrupt [EXT_INT1] void ext_int1_isr(void)
; 0000 002B {
_ext_int1_isr:
	RCALL SUBOPT_0x0
; 0000 002C enc_ka++;
	MOVW R30,R4
	ADIW R30,1
	MOVW R4,R30
; 0000 002D 
; 0000 002E }
	RJMP _0x49
;
;#ifndef RXB8
;#define RXB8 1
;#endif
;
;#ifndef TXB8
;#define TXB8 0
;#endif
;
;#ifndef UPE
;#define UPE 2
;#endif
;
;#ifndef DOR
;#define DOR 3
;#endif
;
;#ifndef FE
;#define FE 4
;#endif
;
;#ifndef UDRE
;#define UDRE 5
;#endif
;
;#ifndef RXC
;#define RXC 7
;#endif
;
;#define FRAMING_ERROR (1<<FE)
;#define PARITY_ERROR (1<<UPE)
;#define DATA_OVERRUN (1<<DOR)
;#define DATA_REGISTER_EMPTY (1<<UDRE)
;#define RX_COMPLETE (1<<RXC)
;
;// USART Receiver buffer
;#define RX_BUFFER_SIZE 8
;char rx_buffer[RX_BUFFER_SIZE];
;
;#if RX_BUFFER_SIZE <= 256
;unsigned char rx_wr_index,rx_rd_index,rx_counter;
;#else
;unsigned int rx_wr_index,rx_rd_index,rx_counter;
;#endif
;
;// This flag is set on USART Receiver buffer overflow
;bit rx_buffer_overflow;
;
;// USART Receiver interrupt service routine
;interrupt [USART_RXC] void usart_rx_isr(void)
; 0000 0061 {
_usart_rx_isr:
	RCALL SUBOPT_0x1
; 0000 0062 char status,data;
; 0000 0063 status=UCSRA;
	RCALL __SAVELOCR2
;	status -> R17
;	data -> R16
	IN   R17,11
; 0000 0064 data=UDR;
	IN   R16,12
; 0000 0065 if ((status & (FRAMING_ERROR | PARITY_ERROR | DATA_OVERRUN))==0)
	MOV  R30,R17
	ANDI R30,LOW(0x1C)
	BRNE _0x3
; 0000 0066    {
; 0000 0067    rx_buffer[rx_wr_index++]=data;
	LDS  R30,_rx_wr_index
	SUBI R30,-LOW(1)
	STS  _rx_wr_index,R30
	RCALL SUBOPT_0x2
	ST   Z,R16
; 0000 0068 #if RX_BUFFER_SIZE == 256
; 0000 0069    // special case for receiver buffer size=256
; 0000 006A    if (++rx_counter == 0) rx_buffer_overflow=1;
; 0000 006B #else
; 0000 006C    if (rx_wr_index == RX_BUFFER_SIZE) rx_wr_index=0;
	LDS  R26,_rx_wr_index
	CPI  R26,LOW(0x8)
	BRNE _0x4
	LDI  R30,LOW(0)
	STS  _rx_wr_index,R30
; 0000 006D    if (++rx_counter == RX_BUFFER_SIZE)
_0x4:
	LDS  R26,_rx_counter
	SUBI R26,-LOW(1)
	STS  _rx_counter,R26
	CPI  R26,LOW(0x8)
	BRNE _0x5
; 0000 006E       {
; 0000 006F       rx_counter=0;
	LDI  R30,LOW(0)
	STS  _rx_counter,R30
; 0000 0070       rx_buffer_overflow=1;
	SET
	BLD  R2,0
; 0000 0071       }
; 0000 0072 #endif
; 0000 0073    }
_0x5:
; 0000 0074 }
_0x3:
	RCALL __LOADLOCR2P
	RJMP _0x4A
;
;#ifndef _DEBUG_TERMINAL_IO_
;// Get a character from the USART Receiver buffer
;#define _ALTERNATE_GETCHAR_
;#pragma used+
;char getchar(void)
; 0000 007B {
_getchar:
; 0000 007C char data;
; 0000 007D while (rx_counter==0);
	ST   -Y,R17
;	data -> R17
_0x6:
	LDS  R30,_rx_counter
	CPI  R30,0
	BREQ _0x6
; 0000 007E data=rx_buffer[rx_rd_index++];
	LDS  R30,_rx_rd_index
	SUBI R30,-LOW(1)
	STS  _rx_rd_index,R30
	RCALL SUBOPT_0x2
	LD   R17,Z
; 0000 007F #if RX_BUFFER_SIZE != 256
; 0000 0080 if (rx_rd_index == RX_BUFFER_SIZE) rx_rd_index=0;
	LDS  R26,_rx_rd_index
	CPI  R26,LOW(0x8)
	BRNE _0x9
	LDI  R30,LOW(0)
	STS  _rx_rd_index,R30
; 0000 0081 #endif
; 0000 0082 #asm("cli")
_0x9:
	cli
; 0000 0083 --rx_counter;
	LDS  R30,_rx_counter
	SUBI R30,LOW(1)
	STS  _rx_counter,R30
; 0000 0084 #asm("sei")
	sei
; 0000 0085 return data;
	MOV  R30,R17
	LD   R17,Y+
	RET
; 0000 0086 }
;#pragma used-
;#endif
;
;// USART Transmitter buffer
;#define TX_BUFFER_SIZE 8
;char tx_buffer[TX_BUFFER_SIZE];
;
;#if TX_BUFFER_SIZE <= 256
;unsigned char tx_wr_index,tx_rd_index,tx_counter;
;#else
;unsigned int tx_wr_index,tx_rd_index,tx_counter;
;#endif
;
;// USART Transmitter interrupt service routine
;interrupt [USART_TXC] void usart_tx_isr(void)
; 0000 0096 {
_usart_tx_isr:
	RCALL SUBOPT_0x1
; 0000 0097 if (tx_counter)
	RCALL SUBOPT_0x3
	CPI  R30,0
	BREQ _0xA
; 0000 0098    {
; 0000 0099    --tx_counter;
	RCALL SUBOPT_0x3
	SUBI R30,LOW(1)
	STS  _tx_counter,R30
; 0000 009A    UDR=tx_buffer[tx_rd_index++];
	LDS  R30,_tx_rd_index
	SUBI R30,-LOW(1)
	STS  _tx_rd_index,R30
	RCALL SUBOPT_0x4
	LD   R30,Z
	OUT  0xC,R30
; 0000 009B #if TX_BUFFER_SIZE != 256
; 0000 009C    if (tx_rd_index == TX_BUFFER_SIZE) tx_rd_index=0;
	LDS  R26,_tx_rd_index
	CPI  R26,LOW(0x8)
	BRNE _0xB
	LDI  R30,LOW(0)
	STS  _tx_rd_index,R30
; 0000 009D #endif
; 0000 009E    }
_0xB:
; 0000 009F }
_0xA:
_0x4A:
	LD   R30,Y+
	OUT  SREG,R30
	LD   R31,Y+
	LD   R30,Y+
	LD   R26,Y+
	RETI
;
;#ifndef _DEBUG_TERMINAL_IO_
;// Write a character to the USART Transmitter buffer
;#define _ALTERNATE_PUTCHAR_
;#pragma used+
;void putchar(char c)
; 0000 00A6 {
_putchar:
; 0000 00A7 while (tx_counter == TX_BUFFER_SIZE);
	ST   -Y,R26
;	c -> Y+0
_0xC:
	LDS  R26,_tx_counter
	CPI  R26,LOW(0x8)
	BREQ _0xC
; 0000 00A8 #asm("cli")
	cli
; 0000 00A9 if (tx_counter || ((UCSRA & DATA_REGISTER_EMPTY)==0))
	RCALL SUBOPT_0x3
	CPI  R30,0
	BRNE _0x10
	SBIC 0xB,5
	RJMP _0xF
_0x10:
; 0000 00AA    {
; 0000 00AB    tx_buffer[tx_wr_index++]=c;
	LDS  R30,_tx_wr_index
	SUBI R30,-LOW(1)
	STS  _tx_wr_index,R30
	RCALL SUBOPT_0x4
	LD   R26,Y
	STD  Z+0,R26
; 0000 00AC #if TX_BUFFER_SIZE != 256
; 0000 00AD    if (tx_wr_index == TX_BUFFER_SIZE) tx_wr_index=0;
	LDS  R26,_tx_wr_index
	CPI  R26,LOW(0x8)
	BRNE _0x12
	LDI  R30,LOW(0)
	STS  _tx_wr_index,R30
; 0000 00AE #endif
; 0000 00AF    ++tx_counter;
_0x12:
	RCALL SUBOPT_0x3
	SUBI R30,-LOW(1)
	STS  _tx_counter,R30
; 0000 00B0    }
; 0000 00B1 else
	RJMP _0x13
_0xF:
; 0000 00B2    UDR=c;
	LD   R30,Y
	OUT  0xC,R30
; 0000 00B3 #asm("sei")
_0x13:
	sei
; 0000 00B4 }
	RJMP _0x2080003
;#pragma used-
;#endif
;
;// Standard Input/Output functions
;#include <stdio.h>
;
;// Timer 0 overflow interrupt service routine
;interrupt [TIM0_OVF] void timer0_ovf_isr(void)
; 0000 00BD {
_timer0_ovf_isr:
	RCALL SUBOPT_0x0
; 0000 00BE TCNT0=0x00;
	LDI  R30,LOW(0)
	OUT  0x32,R30
; 0000 00BF 
; 0000 00C0 timer++;
	MOVW R30,R12
	ADIW R30,1
	MOVW R12,R30
; 0000 00C1 
; 0000 00C2 }
_0x49:
	LD   R30,Y+
	OUT  SREG,R30
	LD   R31,Y+
	LD   R30,Y+
	RETI
;
;
;
;#define dir_kanan PORTB.0
;#define dir_kiri PORTB.6
;#define pwm_kanan OCR1BL
;#define pwm_kiri OCR1AL
;
;
;
;void motor_init()
; 0000 00CE {
_motor_init:
; 0000 00CF  DDRB.0 = 1;
	SBI  0x17,0
; 0000 00D0  DDRB.6 = 1;
	SBI  0x17,6
; 0000 00D1 }
	RET
;
;void maju()
; 0000 00D4 {
_maju:
; 0000 00D5 while (enc_ka<145 && enc_ki<145){
_0x18:
	LDI  R30,LOW(145)
	LDI  R31,HIGH(145)
	CP   R4,R30
	CPC  R5,R31
	BRGE _0x1B
	CP   R6,R30
	CPC  R7,R31
	BRLT _0x1C
_0x1B:
	RJMP _0x1A
_0x1C:
; 0000 00D6  dir_kanan = 0;
	CBI  0x18,0
; 0000 00D7  dir_kiri = 0;
	CBI  0x18,6
; 0000 00D8  pwm_kanan = 50;
	LDI  R30,LOW(50)
	RCALL SUBOPT_0x5
; 0000 00D9  pwm_kiri = 50;
; 0000 00DA //delay_ms(1000);
; 0000 00DB lcd_gotoxy(0,1);
; 0000 00DC              sprintf(buff,"%d %d", enc_ki,enc_ka);
; 0000 00DD 
; 0000 00DE         lcd_puts(buff);
; 0000 00DF 
; 0000 00E0 }
	RJMP _0x18
_0x1A:
; 0000 00E1 rec_ki = enc_ki;
	RCALL SUBOPT_0x6
; 0000 00E2 rec_ka = enc_ka;
; 0000 00E3 enc_ka = 0;
; 0000 00E4 enc_ki = 0;
; 0000 00E5 
; 0000 00E6 }
	RET
;
;void belok_kanan()
; 0000 00E9 {
_belok_kanan:
; 0000 00EA timer = 0;
	CLR  R12
	CLR  R13
; 0000 00EB while
_0x21:
; 0000 00EC ((enc_ka<110 && enc_ki<110) ||
; 0000 00ED //(timer<=105)){
; 0000 00EE (timer<=115)){
	LDI  R30,LOW(110)
	LDI  R31,HIGH(110)
	CP   R4,R30
	CPC  R5,R31
	BRGE _0x24
	CP   R6,R30
	CPC  R7,R31
	BRLT _0x26
_0x24:
	LDI  R30,LOW(115)
	LDI  R31,HIGH(115)
	CP   R30,R12
	CPC  R31,R13
	BRLT _0x23
_0x26:
; 0000 00EF  dir_kanan = 1;
	SBI  0x18,0
; 0000 00F0  dir_kiri = 0;
	CBI  0x18,6
; 0000 00F1  pwm_kanan =50;
	LDI  R30,LOW(50)
	OUT  0x28,R30
; 0000 00F2  pwm_kiri = 125;
	LDI  R30,LOW(125)
	OUT  0x2A,R30
; 0000 00F3 //delay_ms(1900);
; 0000 00F4 
; 0000 00F5 lcd_gotoxy(0,1);
	RCALL SUBOPT_0x7
	LDI  R26,LOW(1)
	RCALL _lcd_gotoxy
; 0000 00F6              sprintf(buff,"%d %d", enc_ki,enc_ka);
	LDI  R30,LOW(_buff)
	LDI  R31,HIGH(_buff)
	RCALL SUBOPT_0x8
	__POINTW1FN _0x0,0
	RCALL SUBOPT_0x8
	MOVW R30,R6
	RCALL __CWD1
	RCALL __PUTPARD1
	MOVW R30,R4
	RCALL __CWD1
	RCALL __PUTPARD1
	LDI  R24,8
	RCALL _sprintf
	ADIW R28,12
; 0000 00F7         lcd_puts(buff);
	LDI  R26,LOW(_buff)
	LDI  R27,HIGH(_buff)
	RCALL _lcd_puts
; 0000 00F8 
; 0000 00F9 }
	RJMP _0x21
_0x23:
; 0000 00FA timerec = timer;
	RJMP _0x2080004
; 0000 00FB rec_ki = enc_ki;
; 0000 00FC rec_ka = enc_ka;
; 0000 00FD enc_ka = 0;
; 0000 00FE enc_ki = 0;
; 0000 00FF maju();
; 0000 0100 
; 0000 0101 }
;
;void belok_kiri()
; 0000 0104 {
_belok_kiri:
; 0000 0105   timer = 0;
	CLR  R12
	CLR  R13
; 0000 0106 while
_0x2C:
; 0000 0107 ((enc_ka<130 && enc_ki<130) ||
; 0000 0108 //(timer<=117)){
; 0000 0109 (timer<=125)){
	LDI  R30,LOW(130)
	LDI  R31,HIGH(130)
	CP   R4,R30
	CPC  R5,R31
	BRGE _0x2F
	CP   R6,R30
	CPC  R7,R31
	BRLT _0x31
_0x2F:
	LDI  R30,LOW(125)
	LDI  R31,HIGH(125)
	CP   R30,R12
	CPC  R31,R13
	BRLT _0x2E
_0x31:
; 0000 010A  dir_kanan = 0;
	CBI  0x18,0
; 0000 010B  dir_kiri = 1;
	SBI  0x18,6
; 0000 010C  pwm_kanan = 125;
	LDI  R30,LOW(125)
	RCALL SUBOPT_0x5
; 0000 010D  pwm_kiri = 50;
; 0000 010E  //delay_ms(2250)
; 0000 010F         lcd_gotoxy(0,1);
; 0000 0110         sprintf(buff,"%d %d", enc_ki,enc_ka);
; 0000 0111         lcd_puts(buff);
; 0000 0112 
; 0000 0113 }
	RJMP _0x2C
_0x2E:
; 0000 0114 timerec = timer;
_0x2080004:
	__PUTWMRN _timerec,0,12,13
; 0000 0115 rec_ki = enc_ki;
	RCALL SUBOPT_0x6
; 0000 0116 rec_ka = enc_ka;
; 0000 0117 enc_ka = 0;
; 0000 0118 enc_ki = 0;
; 0000 0119 maju();
	RCALL _maju
; 0000 011A }
	RET
;
;void stop()
; 0000 011D {
_stop:
; 0000 011E  pwm_kanan = 0;
	LDI  R30,LOW(0)
	OUT  0x28,R30
; 0000 011F  pwm_kiri = 0;
	OUT  0x2A,R30
; 0000 0120 }
	RET
;
;// Declare your global variables here
;unsigned char i,j, data_rx[16];
;
;
;
;
;void main(void)
; 0000 0129 {
_main:
; 0000 012A // Declare your local variables here
; 0000 012B 
; 0000 012C // Input/Output Ports initialization
; 0000 012D // Port A initialization
; 0000 012E // Func7=In Func6=In Func5=In Func4=In Func3=In Func2=In Func1=In Func0=In
; 0000 012F // State7=T State6=T State5=T State4=T State3=T State2=T State1=T State0=T
; 0000 0130 PORTA=0x00;
	LDI  R30,LOW(0)
	OUT  0x1B,R30
; 0000 0131 DDRA=0x00;
	OUT  0x1A,R30
; 0000 0132 
; 0000 0133 // Port B initialization
; 0000 0134 // Func7=Out Func6=Out Func5=In Func4=In Func3=In Func2=In Func1=Out Func0=Out
; 0000 0135 // State7=0 State6=0 State5=T State4=T State3=T State2=T State1=0 State0=0
; 0000 0136 PORTB=0x00;
	OUT  0x18,R30
; 0000 0137 DDRB=0xC3;
	LDI  R30,LOW(195)
	OUT  0x17,R30
; 0000 0138 
; 0000 0139 // Port C initialization
; 0000 013A // Func7=In Func6=In Func5=In Func4=In Func3=In Func2=In Func1=In Func0=In
; 0000 013B // State7=T State6=T State5=T State4=T State3=T State2=T State1=T State0=T
; 0000 013C PORTC=0x00;
	LDI  R30,LOW(0)
	OUT  0x15,R30
; 0000 013D DDRC=0x00;
	OUT  0x14,R30
; 0000 013E 
; 0000 013F // Port D initialization
; 0000 0140 // Func7=In Func6=In Func5=Out Func4=Out Func3=In Func2=In Func1=In Func0=In
; 0000 0141 // State7=T State6=T State5=0 State4=0 State3=T State2=T State1=T State0=T
; 0000 0142 PORTD=0x00;
	OUT  0x12,R30
; 0000 0143 DDRD=0x30;
	LDI  R30,LOW(48)
	OUT  0x11,R30
; 0000 0144 
; 0000 0145 // Timer/Counter 0 initialization
; 0000 0146 // Clock source: System Clock
; 0000 0147 // Clock value: 15.625 kHz
; 0000 0148 // Mode: Normal top=0xFF
; 0000 0149 // OC0 output: Disconnected
; 0000 014A TCCR0=0x04;
	LDI  R30,LOW(4)
	OUT  0x33,R30
; 0000 014B TCNT0=0x00;
	LDI  R30,LOW(0)
	OUT  0x32,R30
; 0000 014C OCR0=0x00;
	OUT  0x3C,R30
; 0000 014D 
; 0000 014E // Timer/Counter 1 initialization
; 0000 014F // Clock source: System Clock
; 0000 0150 // Clock value: 15.625 kHz
; 0000 0151 // Mode: Ph. correct PWM top=0x00FF
; 0000 0152 // OC1A output: Non-Inv.
; 0000 0153 // OC1B output: Non-Inv.
; 0000 0154 // Noise Canceler: Off
; 0000 0155 // Input Capture on Falling Edge
; 0000 0156 // Timer1 Overflow Interrupt: Off
; 0000 0157 // Input Capture Interrupt: Off
; 0000 0158 // Compare A Match Interrupt: Off
; 0000 0159 // Compare B Match Interrupt: Off
; 0000 015A TCCR1A=0xA1;
	LDI  R30,LOW(161)
	OUT  0x2F,R30
; 0000 015B TCCR1B=0x04;
	LDI  R30,LOW(4)
	OUT  0x2E,R30
; 0000 015C TCNT1H=0x00;
	LDI  R30,LOW(0)
	OUT  0x2D,R30
; 0000 015D TCNT1L=0x00;
	OUT  0x2C,R30
; 0000 015E ICR1H=0x00;
	OUT  0x27,R30
; 0000 015F ICR1L=0x00;
	OUT  0x26,R30
; 0000 0160 OCR1AH=0x00;
	OUT  0x2B,R30
; 0000 0161 OCR1AL=0x00;
	OUT  0x2A,R30
; 0000 0162 OCR1BH=0x00;
	OUT  0x29,R30
; 0000 0163 OCR1BL=0x00;
	OUT  0x28,R30
; 0000 0164 
; 0000 0165 // Timer/Counter 2 initialization
; 0000 0166 // Clock source: System Clock
; 0000 0167 // Clock value: Timer2 Stopped
; 0000 0168 // Mode: Normal top=0xFF
; 0000 0169 // OC2 output: Disconnected
; 0000 016A ASSR=0x00;
	OUT  0x22,R30
; 0000 016B TCCR2=0x00;
	OUT  0x25,R30
; 0000 016C TCNT2=0x00;
	OUT  0x24,R30
; 0000 016D OCR2=0x00;
	OUT  0x23,R30
; 0000 016E 
; 0000 016F // External Interrupt(s) initialization
; 0000 0170 // INT0: On
; 0000 0171 // INT0 Mode: Falling Edge
; 0000 0172 // INT1: On
; 0000 0173 // INT1 Mode: Falling Edge
; 0000 0174 // INT2: Off
; 0000 0175 GICR|=0xC0;
	IN   R30,0x3B
	ORI  R30,LOW(0xC0)
	OUT  0x3B,R30
; 0000 0176 MCUCR=0x0A;
	LDI  R30,LOW(10)
	OUT  0x35,R30
; 0000 0177 MCUCSR=0x00;
	LDI  R30,LOW(0)
	OUT  0x34,R30
; 0000 0178 GIFR=0xC0;
	LDI  R30,LOW(192)
	OUT  0x3A,R30
; 0000 0179 
; 0000 017A // Timer(s)/Counter(s) Interrupt(s) initialization
; 0000 017B TIMSK=0x01;
	LDI  R30,LOW(1)
	OUT  0x39,R30
; 0000 017C 
; 0000 017D // USART initialization
; 0000 017E // Communication Parameters: 8 Data, 1 Stop, No Parity
; 0000 017F // USART Receiver: On
; 0000 0180 // USART Transmitter: On
; 0000 0181 // USART Mode: Asynchronous
; 0000 0182 // USART Baud Rate: 9600
; 0000 0183 UCSRA=0x00;
	LDI  R30,LOW(0)
	OUT  0xB,R30
; 0000 0184 UCSRB=0xD8;
	LDI  R30,LOW(216)
	OUT  0xA,R30
; 0000 0185 UCSRC=0x86;
	LDI  R30,LOW(134)
	OUT  0x20,R30
; 0000 0186 UBRRH=0x00;
	LDI  R30,LOW(0)
	OUT  0x20,R30
; 0000 0187 UBRRL=0x19;
	LDI  R30,LOW(25)
	OUT  0x9,R30
; 0000 0188 
; 0000 0189 // Analog Comparator initialization
; 0000 018A // Analog Comparator: Off
; 0000 018B // Analog Comparator Input Capture by Timer/Counter 1: Off
; 0000 018C ACSR=0x80;
	LDI  R30,LOW(128)
	OUT  0x8,R30
; 0000 018D SFIOR=0x00;
	LDI  R30,LOW(0)
	OUT  0x30,R30
; 0000 018E 
; 0000 018F // ADC initialization
; 0000 0190 // ADC disabled
; 0000 0191 ADCSRA=0x00;
	OUT  0x6,R30
; 0000 0192 
; 0000 0193 // SPI initialization
; 0000 0194 // SPI disabled
; 0000 0195 SPCR=0x00;
	OUT  0xD,R30
; 0000 0196 
; 0000 0197 // TWI initialization
; 0000 0198 // TWI disabled
; 0000 0199 TWCR=0x00;
	OUT  0x36,R30
; 0000 019A 
; 0000 019B // Alphanumeric LCD initialization
; 0000 019C // Connections are specified in the
; 0000 019D // Project|Configure|C Compiler|Libraries|Alphanumeric LCD menu:
; 0000 019E // RS - PORTA Bit 0
; 0000 019F // RD - PORTA Bit 1
; 0000 01A0 // EN - PORTA Bit 2
; 0000 01A1 // D4 - PORTA Bit 4
; 0000 01A2 // D5 - PORTA Bit 5
; 0000 01A3 // D6 - PORTA Bit 6
; 0000 01A4 // D7 - PORTA Bit 7
; 0000 01A5 // Characters/line: 16
; 0000 01A6 lcd_init(16);
	LDI  R26,LOW(16)
	RCALL _lcd_init
; 0000 01A7 
; 0000 01A8 // Global enable interrupts
; 0000 01A9 #asm("sei")
	sei
; 0000 01AA  motor_init();
	RCALL _motor_init
; 0000 01AB 
; 0000 01AC while (1)
_0x37:
; 0000 01AD       {
; 0000 01AE            lcd_gotoxy(0,0);
	RCALL SUBOPT_0x7
	LDI  R26,LOW(0)
	RCALL _lcd_gotoxy
; 0000 01AF         lcd_putsf("tunggu perintah");
	__POINTW2FN _0x0,6
	RCALL _lcd_putsf
; 0000 01B0         for(i=0;i<32;i++)
	LDI  R30,LOW(0)
	RCALL SUBOPT_0x9
_0x3B:
	LDS  R26,_i
	CPI  R26,LOW(0x20)
	BRSH _0x3C
; 0000 01B1             {
; 0000 01B2                 data_rx[i] = getchar();
	RCALL SUBOPT_0xA
	PUSH R31
	PUSH R30
	RCALL _getchar
	POP  R26
	POP  R27
	ST   X,R30
; 0000 01B3                 if(data_rx[i]=='0')break;
	RCALL SUBOPT_0xA
	LD   R26,Z
	CPI  R26,LOW(0x30)
	BREQ _0x3C
; 0000 01B4             }
	LDS  R30,_i
	SUBI R30,-LOW(1)
	RCALL SUBOPT_0x9
	RJMP _0x3B
_0x3C:
; 0000 01B5         j=i;
	LDS  R30,_i
	STS  _j,R30
; 0000 01B6         //lcd_gotoxy(0,0);
; 0000 01B7         for(i=0;i<=j;i++)
	LDI  R30,LOW(0)
	RCALL SUBOPT_0x9
_0x3F:
	LDS  R30,_j
	LDS  R26,_i
	CP   R30,R26
	BRLO _0x40
; 0000 01B8             {
; 0000 01B9 
; 0000 01BA 
; 0000 01BB                 //lcd_putchar(data_rx[i]);
; 0000 01BC                 switch(data_rx[i])
	RCALL SUBOPT_0xA
	LD   R30,Z
	LDI  R31,0
; 0000 01BD                 {
; 0000 01BE                 case 'O' : maju();printf("0"); break;
	CPI  R30,LOW(0x4F)
	LDI  R26,HIGH(0x4F)
	CPC  R31,R26
	BRNE _0x44
	RCALL _maju
	__POINTW1FN _0x0,22
	RJMP _0x48
; 0000 01BF                 case 'o' : belok_kanan();printf("1"); break;
_0x44:
	CPI  R30,LOW(0x6F)
	LDI  R26,HIGH(0x6F)
	CPC  R31,R26
	BRNE _0x45
	RCALL _belok_kanan
	__POINTW1FN _0x0,24
	RJMP _0x48
; 0000 01C0                 case '_' : belok_kiri();printf("2"); break;
_0x45:
	CPI  R30,LOW(0x5F)
	LDI  R26,HIGH(0x5F)
	CPC  R31,R26
	BRNE _0x43
	RCALL _belok_kiri
	__POINTW1FN _0x0,26
_0x48:
	ST   -Y,R31
	ST   -Y,R30
	LDI  R24,0
	RCALL _printf
	ADIW R28,2
; 0000 01C1                 }
_0x43:
; 0000 01C2             }
	LDS  R30,_i
	SUBI R30,-LOW(1)
	RCALL SUBOPT_0x9
	RJMP _0x3F
_0x40:
; 0000 01C3         stop();
	RCALL _stop
; 0000 01C4         lcd_gotoxy(0,0);
	RCALL SUBOPT_0x7
	LDI  R26,LOW(0)
	RCALL _lcd_gotoxy
; 0000 01C5         lcd_putsf("sampai");
	__POINTW2FN _0x0,28
	RCALL _lcd_putsf
; 0000 01C6          //printf(" %d ", timerec);
; 0000 01C7         //printf(" %d %d",rec_ki,rec_ka);
; 0000 01C8         delay_ms(2000);
	LDI  R26,LOW(2000)
	LDI  R27,HIGH(2000)
	RCALL _delay_ms
; 0000 01C9 
; 0000 01CA 
; 0000 01CB 
; 0000 01CC 
; 0000 01CD 
; 0000 01CE       };
	RJMP _0x37
; 0000 01CF }
_0x47:
	RJMP _0x47
	#ifndef __SLEEP_DEFINED__
	#define __SLEEP_DEFINED__
	.EQU __se_bit=0x40
	.EQU __sm_mask=0xB0
	.EQU __sm_powerdown=0x20
	.EQU __sm_powersave=0x30
	.EQU __sm_standby=0xA0
	.EQU __sm_ext_standby=0xB0
	.EQU __sm_adc_noise_red=0x10
	.SET power_ctrl_reg=mcucr
	#endif

	.DSEG

	.CSEG
__lcd_write_nibble_G100:
	ST   -Y,R26
	IN   R30,0x1B
	ANDI R30,LOW(0xF)
	MOV  R26,R30
	LD   R30,Y
	ANDI R30,LOW(0xF0)
	OR   R30,R26
	OUT  0x1B,R30
	__DELAY_USB 3
	SBI  0x1B,2
	__DELAY_USB 7
	CBI  0x1B,2
	__DELAY_USB 7
	RJMP _0x2080003
__lcd_write_data:
	ST   -Y,R26
	LD   R26,Y
	RCALL __lcd_write_nibble_G100
    ld    r30,y
    swap  r30
    st    y,r30
	LD   R26,Y
	RCALL __lcd_write_nibble_G100
	__DELAY_USB 67
	RJMP _0x2080003
_lcd_gotoxy:
	ST   -Y,R26
	LD   R30,Y
	LDI  R31,0
	SUBI R30,LOW(-__base_y_G100)
	SBCI R31,HIGH(-__base_y_G100)
	LD   R30,Z
	LDD  R26,Y+1
	ADD  R26,R30
	RCALL __lcd_write_data
	LDD  R30,Y+1
	STS  __lcd_x,R30
	LD   R30,Y
	STS  __lcd_y,R30
	ADIW R28,2
	RET
_lcd_clear:
	LDI  R26,LOW(2)
	RCALL SUBOPT_0xB
	LDI  R26,LOW(12)
	RCALL __lcd_write_data
	LDI  R26,LOW(1)
	RCALL SUBOPT_0xB
	LDI  R30,LOW(0)
	STS  __lcd_y,R30
	STS  __lcd_x,R30
	RET
_lcd_putchar:
	ST   -Y,R26
	LD   R26,Y
	CPI  R26,LOW(0xA)
	BREQ _0x2000005
	LDS  R30,__lcd_maxx
	LDS  R26,__lcd_x
	CP   R26,R30
	BRLO _0x2000004
_0x2000005:
	RCALL SUBOPT_0x7
	LDS  R26,__lcd_y
	SUBI R26,-LOW(1)
	STS  __lcd_y,R26
	RCALL _lcd_gotoxy
	LD   R26,Y
	CPI  R26,LOW(0xA)
	BRNE _0x2000007
	RJMP _0x2080003
_0x2000007:
_0x2000004:
	LDS  R30,__lcd_x
	SUBI R30,-LOW(1)
	STS  __lcd_x,R30
	SBI  0x1B,0
	LD   R26,Y
	RCALL __lcd_write_data
	CBI  0x1B,0
	RJMP _0x2080003
_lcd_puts:
	ST   -Y,R27
	ST   -Y,R26
	ST   -Y,R17
_0x2000008:
	LDD  R26,Y+1
	LDD  R27,Y+1+1
	LD   R30,X+
	STD  Y+1,R26
	STD  Y+1+1,R27
	MOV  R17,R30
	CPI  R30,0
	BREQ _0x200000A
	MOV  R26,R17
	RCALL _lcd_putchar
	RJMP _0x2000008
_0x200000A:
	LDD  R17,Y+0
	RJMP _0x2080002
_lcd_putsf:
	RCALL SUBOPT_0xC
	ST   -Y,R17
_0x200000B:
	LDD  R30,Y+1
	LDD  R31,Y+1+1
	ADIW R30,1
	STD  Y+1,R30
	STD  Y+1+1,R31
	SBIW R30,1
	LPM  R30,Z
	MOV  R17,R30
	CPI  R30,0
	BREQ _0x200000D
	MOV  R26,R17
	RCALL _lcd_putchar
	RJMP _0x200000B
_0x200000D:
	LDD  R17,Y+0
	RJMP _0x2080002
_lcd_init:
	ST   -Y,R26
	IN   R30,0x1A
	ORI  R30,LOW(0xF0)
	OUT  0x1A,R30
	SBI  0x1A,2
	SBI  0x1A,0
	SBI  0x1A,1
	CBI  0x1B,2
	CBI  0x1B,0
	CBI  0x1B,1
	LD   R30,Y
	STS  __lcd_maxx,R30
	SUBI R30,-LOW(128)
	__PUTB1MN __base_y_G100,2
	LD   R30,Y
	SUBI R30,-LOW(192)
	__PUTB1MN __base_y_G100,3
	LDI  R26,LOW(20)
	LDI  R27,0
	RCALL _delay_ms
	RCALL SUBOPT_0xD
	RCALL SUBOPT_0xD
	RCALL SUBOPT_0xD
	LDI  R26,LOW(32)
	RCALL __lcd_write_nibble_G100
	__DELAY_USB 133
	LDI  R26,LOW(40)
	RCALL __lcd_write_data
	LDI  R26,LOW(4)
	RCALL __lcd_write_data
	LDI  R26,LOW(133)
	RCALL __lcd_write_data
	LDI  R26,LOW(6)
	RCALL __lcd_write_data
	RCALL _lcd_clear
_0x2080003:
	ADIW R28,1
	RET
	#ifndef __SLEEP_DEFINED__
	#define __SLEEP_DEFINED__
	.EQU __se_bit=0x40
	.EQU __sm_mask=0xB0
	.EQU __sm_powerdown=0x20
	.EQU __sm_powersave=0x30
	.EQU __sm_standby=0xA0
	.EQU __sm_ext_standby=0xB0
	.EQU __sm_adc_noise_red=0x10
	.SET power_ctrl_reg=mcucr
	#endif

	.CSEG
_put_usart_G101:
	RCALL SUBOPT_0xC
	LDD  R26,Y+2
	RCALL _putchar
	LD   R26,Y
	LDD  R27,Y+1
	RCALL SUBOPT_0xE
_0x2080002:
	ADIW R28,3
	RET
_put_buff_G101:
	RCALL SUBOPT_0xC
	RCALL __SAVELOCR2
	RCALL SUBOPT_0xF
	ADIW R26,2
	RCALL __GETW1P
	SBIW R30,0
	BREQ _0x2020010
	RCALL SUBOPT_0xF
	RCALL SUBOPT_0x10
	MOVW R16,R30
	SBIW R30,0
	BREQ _0x2020012
	__CPWRN 16,17,2
	BRLO _0x2020013
	MOVW R30,R16
	SBIW R30,1
	MOVW R16,R30
	__PUTW1SNS 2,4
_0x2020012:
	RCALL SUBOPT_0xF
	ADIW R26,2
	RCALL SUBOPT_0xE
	SBIW R30,1
	LDD  R26,Y+4
	STD  Z+0,R26
	RCALL SUBOPT_0xF
	RCALL __GETW1P
	TST  R31
	BRMI _0x2020014
	RCALL SUBOPT_0xF
	RCALL SUBOPT_0xE
_0x2020014:
_0x2020013:
	RJMP _0x2020015
_0x2020010:
	RCALL SUBOPT_0xF
	LDI  R30,LOW(65535)
	LDI  R31,HIGH(65535)
	ST   X+,R30
	ST   X,R31
_0x2020015:
	RCALL __LOADLOCR2
	ADIW R28,5
	RET
__print_G101:
	RCALL SUBOPT_0xC
	SBIW R28,6
	RCALL __SAVELOCR6
	LDI  R17,0
	LDD  R26,Y+12
	LDD  R27,Y+12+1
	LDI  R30,LOW(0)
	LDI  R31,HIGH(0)
	ST   X+,R30
	ST   X,R31
_0x2020016:
	LDD  R30,Y+18
	LDD  R31,Y+18+1
	ADIW R30,1
	STD  Y+18,R30
	STD  Y+18+1,R31
	SBIW R30,1
	LPM  R30,Z
	MOV  R18,R30
	CPI  R30,0
	BRNE PC+2
	RJMP _0x2020018
	MOV  R30,R17
	CPI  R30,0
	BRNE _0x202001C
	CPI  R18,37
	BRNE _0x202001D
	LDI  R17,LOW(1)
	RJMP _0x202001E
_0x202001D:
	RCALL SUBOPT_0x11
_0x202001E:
	RJMP _0x202001B
_0x202001C:
	CPI  R30,LOW(0x1)
	BRNE _0x202001F
	CPI  R18,37
	BRNE _0x2020020
	RCALL SUBOPT_0x11
	RJMP _0x20200C9
_0x2020020:
	LDI  R17,LOW(2)
	LDI  R20,LOW(0)
	LDI  R16,LOW(0)
	CPI  R18,45
	BRNE _0x2020021
	LDI  R16,LOW(1)
	RJMP _0x202001B
_0x2020021:
	CPI  R18,43
	BRNE _0x2020022
	LDI  R20,LOW(43)
	RJMP _0x202001B
_0x2020022:
	CPI  R18,32
	BRNE _0x2020023
	LDI  R20,LOW(32)
	RJMP _0x202001B
_0x2020023:
	RJMP _0x2020024
_0x202001F:
	CPI  R30,LOW(0x2)
	BRNE _0x2020025
_0x2020024:
	LDI  R21,LOW(0)
	LDI  R17,LOW(3)
	CPI  R18,48
	BRNE _0x2020026
	ORI  R16,LOW(128)
	RJMP _0x202001B
_0x2020026:
	RJMP _0x2020027
_0x2020025:
	CPI  R30,LOW(0x3)
	BREQ PC+2
	RJMP _0x202001B
_0x2020027:
	CPI  R18,48
	BRLO _0x202002A
	CPI  R18,58
	BRLO _0x202002B
_0x202002A:
	RJMP _0x2020029
_0x202002B:
	LDI  R26,LOW(10)
	MUL  R21,R26
	MOV  R21,R0
	MOV  R30,R18
	SUBI R30,LOW(48)
	ADD  R21,R30
	RJMP _0x202001B
_0x2020029:
	MOV  R30,R18
	CPI  R30,LOW(0x63)
	BRNE _0x202002F
	RCALL SUBOPT_0x12
	RCALL SUBOPT_0x13
	RCALL SUBOPT_0x12
	LDD  R26,Z+4
	ST   -Y,R26
	RCALL SUBOPT_0x14
	RJMP _0x2020030
_0x202002F:
	CPI  R30,LOW(0x73)
	BRNE _0x2020032
	RCALL SUBOPT_0x15
	RCALL SUBOPT_0x16
	RCALL SUBOPT_0x17
	RCALL _strlen
	MOV  R17,R30
	RJMP _0x2020033
_0x2020032:
	CPI  R30,LOW(0x70)
	BRNE _0x2020035
	RCALL SUBOPT_0x15
	RCALL SUBOPT_0x16
	RCALL SUBOPT_0x17
	RCALL _strlenf
	MOV  R17,R30
	ORI  R16,LOW(8)
_0x2020033:
	ORI  R16,LOW(2)
	ANDI R16,LOW(127)
	LDI  R19,LOW(0)
	RJMP _0x2020036
_0x2020035:
	CPI  R30,LOW(0x64)
	BREQ _0x2020039
	CPI  R30,LOW(0x69)
	BRNE _0x202003A
_0x2020039:
	ORI  R16,LOW(4)
	RJMP _0x202003B
_0x202003A:
	CPI  R30,LOW(0x75)
	BRNE _0x202003C
_0x202003B:
	LDI  R30,LOW(_tbl10_G101*2)
	LDI  R31,HIGH(_tbl10_G101*2)
	RCALL SUBOPT_0x18
	LDI  R17,LOW(5)
	RJMP _0x202003D
_0x202003C:
	CPI  R30,LOW(0x58)
	BRNE _0x202003F
	ORI  R16,LOW(8)
	RJMP _0x2020040
_0x202003F:
	CPI  R30,LOW(0x78)
	BREQ PC+2
	RJMP _0x2020071
_0x2020040:
	LDI  R30,LOW(_tbl16_G101*2)
	LDI  R31,HIGH(_tbl16_G101*2)
	RCALL SUBOPT_0x18
	LDI  R17,LOW(4)
_0x202003D:
	SBRS R16,2
	RJMP _0x2020042
	RCALL SUBOPT_0x15
	RCALL SUBOPT_0x16
	RCALL SUBOPT_0x19
	LDD  R26,Y+11
	TST  R26
	BRPL _0x2020043
	LDD  R30,Y+10
	LDD  R31,Y+10+1
	RCALL __ANEGW1
	RCALL SUBOPT_0x19
	LDI  R20,LOW(45)
_0x2020043:
	CPI  R20,0
	BREQ _0x2020044
	SUBI R17,-LOW(1)
	RJMP _0x2020045
_0x2020044:
	ANDI R16,LOW(251)
_0x2020045:
	RJMP _0x2020046
_0x2020042:
	RCALL SUBOPT_0x15
	RCALL SUBOPT_0x16
	RCALL SUBOPT_0x19
_0x2020046:
_0x2020036:
	SBRC R16,0
	RJMP _0x2020047
_0x2020048:
	CP   R17,R21
	BRSH _0x202004A
	SBRS R16,7
	RJMP _0x202004B
	SBRS R16,2
	RJMP _0x202004C
	ANDI R16,LOW(251)
	MOV  R18,R20
	SUBI R17,LOW(1)
	RJMP _0x202004D
_0x202004C:
	LDI  R18,LOW(48)
_0x202004D:
	RJMP _0x202004E
_0x202004B:
	LDI  R18,LOW(32)
_0x202004E:
	RCALL SUBOPT_0x11
	SUBI R21,LOW(1)
	RJMP _0x2020048
_0x202004A:
_0x2020047:
	MOV  R19,R17
	SBRS R16,1
	RJMP _0x202004F
_0x2020050:
	CPI  R19,0
	BREQ _0x2020052
	SBRS R16,3
	RJMP _0x2020053
	LDD  R30,Y+6
	LDD  R31,Y+6+1
	LPM  R18,Z+
	RCALL SUBOPT_0x18
	RJMP _0x2020054
_0x2020053:
	LDD  R26,Y+6
	LDD  R27,Y+6+1
	LD   R18,X+
	STD  Y+6,R26
	STD  Y+6+1,R27
_0x2020054:
	RCALL SUBOPT_0x11
	CPI  R21,0
	BREQ _0x2020055
	SUBI R21,LOW(1)
_0x2020055:
	SUBI R19,LOW(1)
	RJMP _0x2020050
_0x2020052:
	RJMP _0x2020056
_0x202004F:
_0x2020058:
	LDI  R18,LOW(48)
	LDD  R30,Y+6
	LDD  R31,Y+6+1
	RCALL __GETW1PF
	STD  Y+8,R30
	STD  Y+8+1,R31
	LDD  R30,Y+6
	LDD  R31,Y+6+1
	ADIW R30,2
	RCALL SUBOPT_0x18
_0x202005A:
	LDD  R30,Y+8
	LDD  R31,Y+8+1
	LDD  R26,Y+10
	LDD  R27,Y+10+1
	CP   R26,R30
	CPC  R27,R31
	BRLO _0x202005C
	SUBI R18,-LOW(1)
	LDD  R26,Y+8
	LDD  R27,Y+8+1
	LDD  R30,Y+10
	LDD  R31,Y+10+1
	SUB  R30,R26
	SBC  R31,R27
	RCALL SUBOPT_0x19
	RJMP _0x202005A
_0x202005C:
	CPI  R18,58
	BRLO _0x202005D
	SBRS R16,3
	RJMP _0x202005E
	SUBI R18,-LOW(7)
	RJMP _0x202005F
_0x202005E:
	SUBI R18,-LOW(39)
_0x202005F:
_0x202005D:
	SBRC R16,4
	RJMP _0x2020061
	CPI  R18,49
	BRSH _0x2020063
	LDD  R26,Y+8
	LDD  R27,Y+8+1
	SBIW R26,1
	BRNE _0x2020062
_0x2020063:
	RJMP _0x20200CA
_0x2020062:
	CP   R21,R19
	BRLO _0x2020067
	SBRS R16,0
	RJMP _0x2020068
_0x2020067:
	RJMP _0x2020066
_0x2020068:
	LDI  R18,LOW(32)
	SBRS R16,7
	RJMP _0x2020069
	LDI  R18,LOW(48)
_0x20200CA:
	ORI  R16,LOW(16)
	SBRS R16,2
	RJMP _0x202006A
	ANDI R16,LOW(251)
	ST   -Y,R20
	RCALL SUBOPT_0x14
	CPI  R21,0
	BREQ _0x202006B
	SUBI R21,LOW(1)
_0x202006B:
_0x202006A:
_0x2020069:
_0x2020061:
	RCALL SUBOPT_0x11
	CPI  R21,0
	BREQ _0x202006C
	SUBI R21,LOW(1)
_0x202006C:
_0x2020066:
	SUBI R19,LOW(1)
	LDD  R26,Y+8
	LDD  R27,Y+8+1
	SBIW R26,2
	BRLO _0x2020059
	RJMP _0x2020058
_0x2020059:
_0x2020056:
	SBRS R16,0
	RJMP _0x202006D
_0x202006E:
	CPI  R21,0
	BREQ _0x2020070
	SUBI R21,LOW(1)
	LDI  R30,LOW(32)
	ST   -Y,R30
	RCALL SUBOPT_0x14
	RJMP _0x202006E
_0x2020070:
_0x202006D:
_0x2020071:
_0x2020030:
_0x20200C9:
	LDI  R17,LOW(0)
_0x202001B:
	RJMP _0x2020016
_0x2020018:
	LDD  R26,Y+12
	LDD  R27,Y+12+1
	RCALL __GETW1P
	RCALL __LOADLOCR6
	ADIW R28,20
	RET
_sprintf:
	PUSH R15
	MOV  R15,R24
	SBIW R28,6
	RCALL __SAVELOCR4
	RCALL SUBOPT_0x1A
	SBIW R30,0
	BRNE _0x2020072
	LDI  R30,LOW(65535)
	LDI  R31,HIGH(65535)
	RJMP _0x2080001
_0x2020072:
	MOVW R26,R28
	ADIW R26,6
	RCALL __ADDW2R15
	MOVW R16,R26
	RCALL SUBOPT_0x1A
	RCALL SUBOPT_0x18
	LDI  R30,LOW(0)
	STD  Y+8,R30
	STD  Y+8+1,R30
	MOVW R26,R28
	ADIW R26,10
	RCALL SUBOPT_0x1B
	LDI  R30,LOW(_put_buff_G101)
	LDI  R31,HIGH(_put_buff_G101)
	RCALL SUBOPT_0x8
	MOVW R26,R28
	ADIW R26,10
	RCALL __print_G101
	MOVW R18,R30
	LDD  R26,Y+6
	LDD  R27,Y+6+1
	LDI  R30,LOW(0)
	ST   X,R30
	MOVW R30,R18
_0x2080001:
	RCALL __LOADLOCR4
	ADIW R28,10
	POP  R15
	RET
_printf:
	PUSH R15
	MOV  R15,R24
	SBIW R28,6
	RCALL __SAVELOCR2
	MOVW R26,R28
	ADIW R26,4
	RCALL __ADDW2R15
	MOVW R16,R26
	LDI  R30,LOW(0)
	STD  Y+4,R30
	STD  Y+4+1,R30
	STD  Y+6,R30
	STD  Y+6+1,R30
	MOVW R26,R28
	ADIW R26,8
	RCALL SUBOPT_0x1B
	LDI  R30,LOW(_put_usart_G101)
	LDI  R31,HIGH(_put_usart_G101)
	RCALL SUBOPT_0x8
	MOVW R26,R28
	ADIW R26,8
	RCALL __print_G101
	RCALL __LOADLOCR2
	ADIW R28,8
	POP  R15
	RET

	.CSEG

	.CSEG
_strlen:
	RCALL SUBOPT_0xC
    ld   r26,y+
    ld   r27,y+
    clr  r30
    clr  r31
strlen0:
    ld   r22,x+
    tst  r22
    breq strlen1
    adiw r30,1
    rjmp strlen0
strlen1:
    ret
_strlenf:
	RCALL SUBOPT_0xC
    clr  r26
    clr  r27
    ld   r30,y+
    ld   r31,y+
strlenf0:
	lpm  r0,z+
    tst  r0
    breq strlenf1
    adiw r26,1
    rjmp strlenf0
strlenf1:
    movw r30,r26
    ret

	.DSEG
_buff:
	.BYTE 0x21
_timerec:
	.BYTE 0x2
_rx_buffer:
	.BYTE 0x8
_rx_wr_index:
	.BYTE 0x1
_rx_rd_index:
	.BYTE 0x1
_rx_counter:
	.BYTE 0x1
_tx_buffer:
	.BYTE 0x8
_tx_wr_index:
	.BYTE 0x1
_tx_rd_index:
	.BYTE 0x1
_tx_counter:
	.BYTE 0x1
_i:
	.BYTE 0x1
_j:
	.BYTE 0x1
_data_rx:
	.BYTE 0x10
__base_y_G100:
	.BYTE 0x4
__lcd_x:
	.BYTE 0x1
__lcd_y:
	.BYTE 0x1
__lcd_maxx:
	.BYTE 0x1

	.CSEG
;OPTIMIZER ADDED SUBROUTINE, CALLED 3 TIMES, CODE SIZE REDUCTION:4 WORDS
SUBOPT_0x0:
	ST   -Y,R30
	ST   -Y,R31
	IN   R30,SREG
	ST   -Y,R30
	RET

;OPTIMIZER ADDED SUBROUTINE, CALLED 2 TIMES, CODE SIZE REDUCTION:2 WORDS
SUBOPT_0x1:
	ST   -Y,R26
	ST   -Y,R30
	ST   -Y,R31
	IN   R30,SREG
	ST   -Y,R30
	RET

;OPTIMIZER ADDED SUBROUTINE, CALLED 2 TIMES, CODE SIZE REDUCTION:3 WORDS
SUBOPT_0x2:
	SUBI R30,LOW(1)
	LDI  R31,0
	SUBI R30,LOW(-_rx_buffer)
	SBCI R31,HIGH(-_rx_buffer)
	RET

;OPTIMIZER ADDED SUBROUTINE, CALLED 4 TIMES, CODE SIZE REDUCTION:1 WORDS
SUBOPT_0x3:
	LDS  R30,_tx_counter
	RET

;OPTIMIZER ADDED SUBROUTINE, CALLED 2 TIMES, CODE SIZE REDUCTION:3 WORDS
SUBOPT_0x4:
	SUBI R30,LOW(1)
	LDI  R31,0
	SUBI R30,LOW(-_tx_buffer)
	SBCI R31,HIGH(-_tx_buffer)
	RET

;OPTIMIZER ADDED SUBROUTINE, CALLED 2 TIMES, CODE SIZE REDUCTION:26 WORDS
SUBOPT_0x5:
	OUT  0x28,R30
	LDI  R30,LOW(50)
	OUT  0x2A,R30
	LDI  R30,LOW(0)
	ST   -Y,R30
	LDI  R26,LOW(1)
	RCALL _lcd_gotoxy
	LDI  R30,LOW(_buff)
	LDI  R31,HIGH(_buff)
	ST   -Y,R31
	ST   -Y,R30
	__POINTW1FN _0x0,0
	ST   -Y,R31
	ST   -Y,R30
	MOVW R30,R6
	RCALL __CWD1
	RCALL __PUTPARD1
	MOVW R30,R4
	RCALL __CWD1
	RCALL __PUTPARD1
	LDI  R24,8
	RCALL _sprintf
	ADIW R28,12
	LDI  R26,LOW(_buff)
	LDI  R27,HIGH(_buff)
	RJMP _lcd_puts

;OPTIMIZER ADDED SUBROUTINE, CALLED 2 TIMES, CODE SIZE REDUCTION:3 WORDS
SUBOPT_0x6:
	MOVW R8,R6
	MOVW R10,R4
	CLR  R4
	CLR  R5
	CLR  R6
	CLR  R7
	RET

;OPTIMIZER ADDED SUBROUTINE, CALLED 4 TIMES, CODE SIZE REDUCTION:1 WORDS
SUBOPT_0x7:
	LDI  R30,LOW(0)
	ST   -Y,R30
	RET

;OPTIMIZER ADDED SUBROUTINE, CALLED 6 TIMES, CODE SIZE REDUCTION:3 WORDS
SUBOPT_0x8:
	ST   -Y,R31
	ST   -Y,R30
	RET

;OPTIMIZER ADDED SUBROUTINE, CALLED 4 TIMES, CODE SIZE REDUCTION:1 WORDS
SUBOPT_0x9:
	STS  _i,R30
	RET

;OPTIMIZER ADDED SUBROUTINE, CALLED 3 TIMES, CODE SIZE REDUCTION:10 WORDS
SUBOPT_0xA:
	LDS  R30,_i
	LDI  R31,0
	SUBI R30,LOW(-_data_rx)
	SBCI R31,HIGH(-_data_rx)
	RET

;OPTIMIZER ADDED SUBROUTINE, CALLED 2 TIMES, CODE SIZE REDUCTION:3 WORDS
SUBOPT_0xB:
	RCALL __lcd_write_data
	LDI  R26,LOW(3)
	LDI  R27,0
	RJMP _delay_ms

;OPTIMIZER ADDED SUBROUTINE, CALLED 6 TIMES, CODE SIZE REDUCTION:3 WORDS
SUBOPT_0xC:
	ST   -Y,R27
	ST   -Y,R26
	RET

;OPTIMIZER ADDED SUBROUTINE, CALLED 3 TIMES, CODE SIZE REDUCTION:6 WORDS
SUBOPT_0xD:
	LDI  R26,LOW(48)
	RCALL __lcd_write_nibble_G100
	__DELAY_USB 133
	RET

;OPTIMIZER ADDED SUBROUTINE, CALLED 3 TIMES, CODE SIZE REDUCTION:6 WORDS
SUBOPT_0xE:
	LD   R30,X+
	LD   R31,X+
	ADIW R30,1
	ST   -X,R31
	ST   -X,R30
	RET

;OPTIMIZER ADDED SUBROUTINE, CALLED 6 TIMES, CODE SIZE REDUCTION:3 WORDS
SUBOPT_0xF:
	LDD  R26,Y+2
	LDD  R27,Y+2+1
	RET

;OPTIMIZER ADDED SUBROUTINE, CALLED 5 TIMES, CODE SIZE REDUCTION:2 WORDS
SUBOPT_0x10:
	ADIW R26,4
	RCALL __GETW1P
	RET

;OPTIMIZER ADDED SUBROUTINE, CALLED 5 TIMES, CODE SIZE REDUCTION:18 WORDS
SUBOPT_0x11:
	ST   -Y,R18
	LDD  R26,Y+13
	LDD  R27,Y+13+1
	LDD  R30,Y+15
	LDD  R31,Y+15+1
	ICALL
	RET

;OPTIMIZER ADDED SUBROUTINE, CALLED 6 TIMES, CODE SIZE REDUCTION:3 WORDS
SUBOPT_0x12:
	LDD  R30,Y+16
	LDD  R31,Y+16+1
	RET

;OPTIMIZER ADDED SUBROUTINE, CALLED 5 TIMES, CODE SIZE REDUCTION:6 WORDS
SUBOPT_0x13:
	SBIW R30,4
	STD  Y+16,R30
	STD  Y+16+1,R31
	RET

;OPTIMIZER ADDED SUBROUTINE, CALLED 3 TIMES, CODE SIZE REDUCTION:6 WORDS
SUBOPT_0x14:
	LDD  R26,Y+13
	LDD  R27,Y+13+1
	LDD  R30,Y+15
	LDD  R31,Y+15+1
	ICALL
	RET

;OPTIMIZER ADDED SUBROUTINE, CALLED 4 TIMES, CODE SIZE REDUCTION:1 WORDS
SUBOPT_0x15:
	RCALL SUBOPT_0x12
	RJMP SUBOPT_0x13

;OPTIMIZER ADDED SUBROUTINE, CALLED 4 TIMES, CODE SIZE REDUCTION:4 WORDS
SUBOPT_0x16:
	LDD  R26,Y+16
	LDD  R27,Y+16+1
	RJMP SUBOPT_0x10

;OPTIMIZER ADDED SUBROUTINE, CALLED 2 TIMES, CODE SIZE REDUCTION:1 WORDS
SUBOPT_0x17:
	STD  Y+6,R30
	STD  Y+6+1,R31
	LDD  R26,Y+6
	LDD  R27,Y+6+1
	RET

;OPTIMIZER ADDED SUBROUTINE, CALLED 5 TIMES, CODE SIZE REDUCTION:2 WORDS
SUBOPT_0x18:
	STD  Y+6,R30
	STD  Y+6+1,R31
	RET

;OPTIMIZER ADDED SUBROUTINE, CALLED 4 TIMES, CODE SIZE REDUCTION:1 WORDS
SUBOPT_0x19:
	STD  Y+10,R30
	STD  Y+10+1,R31
	RET

;OPTIMIZER ADDED SUBROUTINE, CALLED 2 TIMES, CODE SIZE REDUCTION:1 WORDS
SUBOPT_0x1A:
	MOVW R26,R28
	ADIW R26,12
	RCALL __ADDW2R15
	RCALL __GETW1P
	RET

;OPTIMIZER ADDED SUBROUTINE, CALLED 2 TIMES, CODE SIZE REDUCTION:2 WORDS
SUBOPT_0x1B:
	RCALL __ADDW2R15
	RCALL __GETW1P
	RCALL SUBOPT_0x8
	ST   -Y,R17
	ST   -Y,R16
	RET


	.CSEG
_delay_ms:
	adiw r26,0
	breq __delay_ms1
__delay_ms0:
	__DELAY_USW 0x3E8
	wdr
	sbiw r26,1
	brne __delay_ms0
__delay_ms1:
	ret

__ADDW2R15:
	CLR  R0
	ADD  R26,R15
	ADC  R27,R0
	RET

__ANEGW1:
	NEG  R31
	NEG  R30
	SBCI R31,0
	RET

__CWD1:
	MOV  R22,R31
	ADD  R22,R22
	SBC  R22,R22
	MOV  R23,R22
	RET

__GETW1P:
	LD   R30,X+
	LD   R31,X
	SBIW R26,1
	RET

__GETW1PF:
	LPM  R0,Z+
	LPM  R31,Z
	MOV  R30,R0
	RET

__PUTPARD1:
	ST   -Y,R23
	ST   -Y,R22
	ST   -Y,R31
	ST   -Y,R30
	RET

__SAVELOCR6:
	ST   -Y,R21
__SAVELOCR5:
	ST   -Y,R20
__SAVELOCR4:
	ST   -Y,R19
__SAVELOCR3:
	ST   -Y,R18
__SAVELOCR2:
	ST   -Y,R17
	ST   -Y,R16
	RET

__LOADLOCR6:
	LDD  R21,Y+5
__LOADLOCR5:
	LDD  R20,Y+4
__LOADLOCR4:
	LDD  R19,Y+3
__LOADLOCR3:
	LDD  R18,Y+2
__LOADLOCR2:
	LDD  R17,Y+1
	LD   R16,Y
	RET

__LOADLOCR2P:
	LD   R16,Y+
	LD   R17,Y+
	RET

;END OF CODE MARKER
__END_OF_CODE:
