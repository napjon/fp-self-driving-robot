/*****************************************************
This program was produced by the
CodeWizardAVR V2.05.3 Standard
Automatic Program Generator
? Copyright 1998-2011 Pavel Haiduc, HP InfoTech s.r.l.
http://www.hpinfotech.com

Project : 
Version : 
Date    : 12/14/2012
Author  : PerTic@n
Company : If You Like This Software,Buy It
Comments: 


Chip type               : ATmega8535
Program type            : Application
AVR Core Clock frequency: 4.000000 MHz
Memory model            : Small
External RAM size       : 0
Data Stack size         : 128
*****************************************************/

#include <mega8535.h>


#include <delay.h>

// Alphanumeric LCD functions
#include <alcd.h>
  int enc_ka, enc_ki,rec_ki,rec_ka; 
     unsigned char buff[33];
     int timer,timerec;
// External Interrupt 0 service routine
interrupt [EXT_INT0] void ext_int0_isr(void)
{
enc_ki++;

}

// External Interrupt 1 service routine
interrupt [EXT_INT1] void ext_int1_isr(void)
{
enc_ka++;

}

#ifndef RXB8
#define RXB8 1
#endif

#ifndef TXB8
#define TXB8 0
#endif

#ifndef UPE
#define UPE 2
#endif

#ifndef DOR
#define DOR 3
#endif

#ifndef FE
#define FE 4
#endif

#ifndef UDRE
#define UDRE 5
#endif

#ifndef RXC
#define RXC 7
#endif

#define FRAMING_ERROR (1<<FE)
#define PARITY_ERROR (1<<UPE)
#define DATA_OVERRUN (1<<DOR)
#define DATA_REGISTER_EMPTY (1<<UDRE)
#define RX_COMPLETE (1<<RXC)

// USART Receiver buffer
#define RX_BUFFER_SIZE 8
char rx_buffer[RX_BUFFER_SIZE];

#if RX_BUFFER_SIZE <= 256
unsigned char rx_wr_index,rx_rd_index,rx_counter;
#else
unsigned int rx_wr_index,rx_rd_index,rx_counter;
#endif

// This flag is set on USART Receiver buffer overflow
bit rx_buffer_overflow;

// USART Receiver interrupt service routine
interrupt [USART_RXC] void usart_rx_isr(void)
{
char status,data;
status=UCSRA;
data=UDR;
if ((status & (FRAMING_ERROR | PARITY_ERROR | DATA_OVERRUN))==0)
   {
   rx_buffer[rx_wr_index++]=data;
#if RX_BUFFER_SIZE == 256
   // special case for receiver buffer size=256
   if (++rx_counter == 0) rx_buffer_overflow=1;
#else
   if (rx_wr_index == RX_BUFFER_SIZE) rx_wr_index=0;
   if (++rx_counter == RX_BUFFER_SIZE)
      {
      rx_counter=0;
      rx_buffer_overflow=1;
      }
#endif
   }
}

#ifndef _DEBUG_TERMINAL_IO_
// Get a character from the USART Receiver buffer
#define _ALTERNATE_GETCHAR_
#pragma used+
char getchar(void)
{
char data;
while (rx_counter==0);
data=rx_buffer[rx_rd_index++];
#if RX_BUFFER_SIZE != 256
if (rx_rd_index == RX_BUFFER_SIZE) rx_rd_index=0;
#endif
#asm("cli")
--rx_counter;
#asm("sei")
return data;
}
#pragma used-
#endif

// USART Transmitter buffer
#define TX_BUFFER_SIZE 8
char tx_buffer[TX_BUFFER_SIZE];

#if TX_BUFFER_SIZE <= 256
unsigned char tx_wr_index,tx_rd_index,tx_counter;
#else
unsigned int tx_wr_index,tx_rd_index,tx_counter;
#endif

// USART Transmitter interrupt service routine
interrupt [USART_TXC] void usart_tx_isr(void)
{
if (tx_counter)
   {
   --tx_counter;
   UDR=tx_buffer[tx_rd_index++];
#if TX_BUFFER_SIZE != 256
   if (tx_rd_index == TX_BUFFER_SIZE) tx_rd_index=0;
#endif
   }
}

#ifndef _DEBUG_TERMINAL_IO_
// Write a character to the USART Transmitter buffer
#define _ALTERNATE_PUTCHAR_
#pragma used+
void putchar(char c)
{
while (tx_counter == TX_BUFFER_SIZE);
#asm("cli")
if (tx_counter || ((UCSRA & DATA_REGISTER_EMPTY)==0))
   {
   tx_buffer[tx_wr_index++]=c;
#if TX_BUFFER_SIZE != 256
   if (tx_wr_index == TX_BUFFER_SIZE) tx_wr_index=0;
#endif
   ++tx_counter;
   }
else
   UDR=c;
#asm("sei")
}
#pragma used-
#endif

// Standard Input/Output functions
#include <stdio.h>

// Timer 0 overflow interrupt service routine
interrupt [TIM0_OVF] void timer0_ovf_isr(void)
{
TCNT0=0x00;
  
timer++;

}



#define dir_kanan PORTB.0
#define dir_kiri PORTB.6
#define pwm_kanan OCR1BL
#define pwm_kiri OCR1AL 



void motor_init()
{
 DDRB.0 = 1;
 DDRB.6 = 1;
}

void maju()
{
while (enc_ka<145 && enc_ki<145){
 dir_kanan = 0;
 dir_kiri = 0;
 pwm_kanan = 50;
 pwm_kiri = 50; 
//delay_ms(1000);
lcd_gotoxy(0,1);
             sprintf(buff,"%d %d", enc_ki,enc_ka);
             
        lcd_puts(buff);
        
}
rec_ki = enc_ki;
rec_ka = enc_ka;
enc_ka = 0;
enc_ki = 0;

}

void belok_kanan()
{
timer = 0;
while 
((enc_ka<110 && enc_ki<110) || 
//(timer<=105)){
(timer<=115)){
 dir_kanan = 1;
 dir_kiri = 0;
 pwm_kanan =50;
 pwm_kiri = 125; 
//delay_ms(1900);

lcd_gotoxy(0,1);
             sprintf(buff,"%d %d", enc_ki,enc_ka);
        lcd_puts(buff);
       
}
timerec = timer; 
rec_ki = enc_ki;
rec_ka = enc_ka;
enc_ka = 0;
enc_ki = 0;
maju();

}

void belok_kiri()
{
  timer = 0;                                                          
while 
((enc_ka<130 && enc_ki<130) || 
//(timer<=117)){
(timer<=125)){
 dir_kanan = 0;
 dir_kiri = 1;
 pwm_kanan = 125;
 pwm_kiri = 50; 
 //delay_ms(2250)
        lcd_gotoxy(0,1);
        sprintf(buff,"%d %d", enc_ki,enc_ka);
        lcd_puts(buff);
        
}
timerec = timer;
rec_ki = enc_ki;
rec_ka = enc_ka;
enc_ka = 0;
enc_ki = 0;
maju();
} 

void stop()
{
 pwm_kanan = 0;
 pwm_kiri = 0; 
}

// Declare your global variables here
unsigned char i,j, data_rx[16];




void main(void)
{
// Declare your local variables here

// Input/Output Ports initialization
// Port A initialization
// Func7=In Func6=In Func5=In Func4=In Func3=In Func2=In Func1=In Func0=In 
// State7=T State6=T State5=T State4=T State3=T State2=T State1=T State0=T 
PORTA=0x00;
DDRA=0x00;

// Port B initialization
// Func7=Out Func6=Out Func5=In Func4=In Func3=In Func2=In Func1=Out Func0=Out 
// State7=0 State6=0 State5=T State4=T State3=T State2=T State1=0 State0=0 
PORTB=0x00;
DDRB=0xC3;

// Port C initialization
// Func7=In Func6=In Func5=In Func4=In Func3=In Func2=In Func1=In Func0=In 
// State7=T State6=T State5=T State4=T State3=T State2=T State1=T State0=T 
PORTC=0x00;
DDRC=0x00;

// Port D initialization
// Func7=In Func6=In Func5=Out Func4=Out Func3=In Func2=In Func1=In Func0=In 
// State7=T State6=T State5=0 State4=0 State3=T State2=T State1=T State0=T 
PORTD=0x00;
DDRD=0x30;

// Timer/Counter 0 initialization
// Clock source: System Clock
// Clock value: 15.625 kHz
// Mode: Normal top=0xFF
// OC0 output: Disconnected
TCCR0=0x04;
TCNT0=0x00;
OCR0=0x00;

// Timer/Counter 1 initialization
// Clock source: System Clock
// Clock value: 15.625 kHz
// Mode: Ph. correct PWM top=0x00FF
// OC1A output: Non-Inv.
// OC1B output: Non-Inv.
// Noise Canceler: Off
// Input Capture on Falling Edge
// Timer1 Overflow Interrupt: Off
// Input Capture Interrupt: Off
// Compare A Match Interrupt: Off
// Compare B Match Interrupt: Off
TCCR1A=0xA1;
TCCR1B=0x04;
TCNT1H=0x00;
TCNT1L=0x00;
ICR1H=0x00;
ICR1L=0x00;
OCR1AH=0x00;
OCR1AL=0x00;
OCR1BH=0x00;
OCR1BL=0x00;

// Timer/Counter 2 initialization
// Clock source: System Clock
// Clock value: Timer2 Stopped
// Mode: Normal top=0xFF
// OC2 output: Disconnected
ASSR=0x00;
TCCR2=0x00;
TCNT2=0x00;
OCR2=0x00;

// External Interrupt(s) initialization
// INT0: On
// INT0 Mode: Falling Edge
// INT1: On
// INT1 Mode: Falling Edge
// INT2: Off
GICR|=0xC0;
MCUCR=0x0A;
MCUCSR=0x00;
GIFR=0xC0;

// Timer(s)/Counter(s) Interrupt(s) initialization
TIMSK=0x01;

// USART initialization
// Communication Parameters: 8 Data, 1 Stop, No Parity
// USART Receiver: On
// USART Transmitter: On
// USART Mode: Asynchronous
// USART Baud Rate: 9600
UCSRA=0x00;
UCSRB=0xD8;
UCSRC=0x86;
UBRRH=0x00;
UBRRL=0x19;

// Analog Comparator initialization
// Analog Comparator: Off
// Analog Comparator Input Capture by Timer/Counter 1: Off
ACSR=0x80;
SFIOR=0x00;

// ADC initialization
// ADC disabled
ADCSRA=0x00;

// SPI initialization
// SPI disabled
SPCR=0x00;

// TWI initialization
// TWI disabled
TWCR=0x00;

// Alphanumeric LCD initialization
// Connections are specified in the
// Project|Configure|C Compiler|Libraries|Alphanumeric LCD menu:
// RS - PORTA Bit 0
// RD - PORTA Bit 1
// EN - PORTA Bit 2
// D4 - PORTA Bit 4
// D5 - PORTA Bit 5
// D6 - PORTA Bit 6
// D7 - PORTA Bit 7
// Characters/line: 16
lcd_init(16);

// Global enable interrupts
#asm("sei")
 motor_init();

while (1)
      {
           lcd_gotoxy(0,0);
        lcd_putsf("tunggu perintah");
        for(i=0;i<32;i++)
            {
                data_rx[i] = getchar();
                if(data_rx[i]=='0')break;
            } 
        j=i;
        //lcd_gotoxy(0,0);
        for(i=0;i<=j;i++)
            {  
            
        
                //lcd_putchar(data_rx[i]);
                switch(data_rx[i])
                {
                case 'O' : maju();printf("0"); break; 
                case 'o' : belok_kanan();printf("1"); break;
                case '_' : belok_kiri();printf("2"); break;
                }
            } 
        stop(); 
        lcd_gotoxy(0,0);
        lcd_putsf("sampai");
         //printf(" %d ", timerec);
        //printf(" %d %d",rec_ki,rec_ka);
        delay_ms(2000); 





      };
}
