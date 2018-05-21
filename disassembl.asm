In archive /tmp/arduino_cache_497364/core/core_arduino_avr_mega_cpu_atmega1280_5c62662f89b3fec44ee43cd72a45c670.a:

wiring_pulse.S.o:     file format elf32-avr

Sections:
Idx Name          Size      VMA       LMA       File off  Algn
  0 .text         0000008a  00000000  00000000  00000034  2**0
                  CONTENTS, ALLOC, LOAD, RELOC, READONLY, CODE
  1 .data         00000000  00000000  00000000  000000be  2**0
                  CONTENTS, ALLOC, LOAD, DATA
  2 .bss          00000000  00000000  00000000  000000be  2**0
                  ALLOC
  3 .debug_line   0000021e  00000000  00000000  000000be  2**0
                  CONTENTS, RELOC, READONLY, DEBUGGING
  4 .debug_info   0000009c  00000000  00000000  000002dc  2**0
                  CONTENTS, RELOC, READONLY, DEBUGGING
  5 .debug_abbrev 00000014  00000000  00000000  00000378  2**0
                  CONTENTS, READONLY, DEBUGGING
  6 .debug_aranges 00000020  00000000  00000000  00000390  2**3
                  CONTENTS, RELOC, READONLY, DEBUGGING

Disassembly of section .text:

00000000 <countPulseASM>:

countPulseASM:

.LM0:
.LFBB1:
    push r12   ;   ;  130 pushqi1/1 [length = 1]
   0:	cf 92       	push	r12
    push r13   ;   ;  131 pushqi1/1 [length = 1]
   2:	df 92       	push	r13
    push r14   ;   ;  132 pushqi1/1 [length = 1]
   4:	ef 92       	push	r14
    push r15   ;   ;  133 pushqi1/1 [length = 1]
   6:	ff 92       	push	r15
    push r16   ;   ;  134 pushqi1/1 [length = 1]
   8:	0f 93       	push	r16
    push r17   ;   ;  135 pushqi1/1 [length = 1]
   a:	1f 93       	push	r17
/* prologue: function */
/* frame size = 0 */
/* stack size = 6 */
.L__stack_usage = 6
    mov r30,r24  ;  port, port   ;  2 *movhi/1  [length = 2]
   c:	e8 2f       	mov	r30, r24
    mov r31,r25  ;  port, port
   e:	f9 2f       	mov	r31, r25
/*     unsigned long width = 0;
***     // wait for any previous pulse to end
***     while ((*port & bit) == stateMask)
*/
.LM1:
    rjmp .L2   ;   ;  181 jump  [length = 1]
  10:	00 c0       	rjmp	.+0      	; 0x12 <countPulseASM+0x12>
.L4:
/*         if (--maxloops == 0) */
.LM2:
    subi r16,1   ;  maxloops,  ;  17  addsi3/2  [length = 4]
  12:	01 50       	subi	r16, 0x01	; 1
    sbc r17, r1   ;  maxloops
  14:	11 09       	sbc	r17, r1
    sbc r18, r1   ;  maxloops
  16:	21 09       	sbc	r18, r1
    sbc r19, r1   ;  maxloops
  18:	31 09       	sbc	r19, r1
    breq .L13  ; ,   ;  19  branch  [length = 1]
  1a:	01 f0       	breq	.+0      	; 0x1c <countPulseASM+0x1c>
.L2:
/*         if (--maxloops == 0) */
.LM3:
    ld r25,Z   ;  D.1554, *port_7(D)   ;  22  movqi_insn/4  [length = 1]
  1c:	90 81       	ld	r25, Z
    and r25,r22  ;  D.1554, bit  ;  24  andqi3/1  [length = 1]
  1e:	96 23       	and	r25, r22
    cp r25,r20   ;  D.1554, stateMask  ;  25  *cmpqi/2  [length = 1]
  20:	94 17       	cp	r25, r20
    breq .L4   ; ,   ;  26  branch  [length = 1]
  22:	01 f0       	breq	.+0      	; 0x24 <countPulseASM+0x24>
    rjmp .L6   ;   ;  184 jump  [length = 1]
  24:	00 c0       	rjmp	.+0      	; 0x26 <countPulseASM+0x26>
***     // wait for the pulse to start
***     while ((*port & bit) != stateMask)
***         if (--maxloops == 0)
*/
.LM4:
    subi r16,1   ;  maxloops,  ;  31  addsi3/2  [length = 4]
  26:	01 50       	subi	r16, 0x01	; 1
    sbc r17, r1   ;  maxloops
  28:	11 09       	sbc	r17, r1
    sbc r18, r1   ;  maxloops
  2a:	21 09       	sbc	r18, r1
    sbc r19, r1   ;  maxloops
  2c:	31 09       	sbc	r19, r1
    breq .L13  ; ,   ;  33  branch  [length = 1]
  2e:	01 f0       	breq	.+0      	; 0x30 <countPulseASM+0x30>
.L6:
/*         if (--maxloops == 0) */
.LM5:
    ld r25,Z   ;  D.1554, *port_7(D)   ;  41  movqi_insn/4  [length = 1]
  30:	90 81       	ld	r25, Z
    and r25,r22  ;  D.1554, bit  ;  43  andqi3/1  [length = 1]
  32:	96 23       	and	r25, r22
    cpse r25,r20   ;  D.1554, stateMask  ;  44  enable_interrupt-3  [length = 1]
  34:	94 13       	cpse	r25, r20
    rjmp .L7   ;
  36:	00 c0       	rjmp	.+0      	; 0x38 <countPulseASM+0x38>
    mov r12, r1   ;  width  ;  7 *movsi/2  [length = 4]
  38:	c1 2c       	mov	r12, r1
    mov r13, r1   ;  width
  3a:	d1 2c       	mov	r13, r1
    mov r14, r1   ;  width
  3c:	e1 2c       	mov	r14, r1
    mov r15, r1   ;  width
  3e:	f1 2c       	mov	r15, r1
    rjmp .L9   ;   ;  186 jump  [length = 1]
  40:	00 c0       	rjmp	.+0      	; 0x42 <countPulseASM+0x42>
***     // wait for the pulse to stop
***     while ((*port & bit) == stateMask) {
***         if (++width == maxloops)
*/
.LM6:
    ldi r24,-1   ; ,   ;  50  addsi3/3  [length = 5]
  42:	8f ef       	ldi	r24, 0xFF	; 255
    sub r12,r24  ;  width,
  44:	c8 1a       	sub	r12, r24
    sbc r13,r24  ;  width,
  46:	d8 0a       	sbc	r13, r24
    sbc r14,r24  ;  width,
  48:	e8 0a       	sbc	r14, r24
    sbc r15,r24  ;  width,
  4a:	f8 0a       	sbc	r15, r24
    cp r16,r12   ;  maxloops, width  ;  51  *cmpsi/2  [length = 4]
  4c:	0c 15       	cp	r16, r12
    cpc r17,r13  ;  maxloops, width
  4e:	1d 05       	cpc	r17, r13
    cpc r18,r14  ;  maxloops, width
  50:	2e 05       	cpc	r18, r14
    cpc r19,r15  ;  maxloops, width
  52:	3f 05       	cpc	r19, r15
    breq .L13  ; ,   ;  52  branch  [length = 1]
  54:	01 f0       	breq	.+0      	; 0x56 <countPulseASM+0x56>
.L9:
/*         if (++width == maxloops) */
.LM7:
    ld r24,Z   ;  D.1554, *port_7(D)   ;  60  movqi_insn/4  [length = 1]
  56:	80 81       	ld	r24, Z
    and r24,r22  ;  D.1554, bit  ;  62  andqi3/1  [length = 1]
  58:	86 23       	and	r24, r22
    cp r24,r20   ;  D.1554, stateMask  ;  63  *cmpqi/2  [length = 1]
  5a:	84 17       	cp	r24, r20
    breq .L10  ; ,   ;  64  branch  [length = 1]
  5c:	01 f0       	breq	.+0      	; 0x5e <countPulseASM+0x5e>
/*             return 0;
***     }
***     return width;
*/
.LM8:
    mov r22,r12  ;  D.1553, width  ;  108 movqi_insn/1  [length = 1]
  5e:	6c 2d       	mov	r22, r12
    mov r23,r13  ;  D.1553, width  ;  109 movqi_insn/1  [length = 1]
  60:	7d 2d       	mov	r23, r13
    mov r24,r14  ;  D.1553, width  ;  110 movqi_insn/1  [length = 1]
  62:	8e 2d       	mov	r24, r14
    mov r25,r15  ;  D.1553, width  ;  111 movqi_insn/1  [length = 1]
  64:	9f 2d       	mov	r25, r15
/* epilogue start */
.LM9:
    pop r17  ;   ;  171 popqi [length = 1]
  66:	1f 91       	pop	r17
    pop r16  ;   ;  172 popqi [length = 1]
  68:	0f 91       	pop	r16
    pop r15  ;   ;  173 popqi [length = 1]
  6a:	ff 90       	pop	r15
    pop r14  ;   ;  174 popqi [length = 1]
  6c:	ef 90       	pop	r14
    pop r13  ;   ;  175 popqi [length = 1]
  6e:	df 90       	pop	r13
    pop r12  ;   ;  176 popqi [length = 1]
  70:	cf 90       	pop	r12
    ret  ;  177 return_from_epilogue  [length = 1]
  72:	08 95       	ret
.L13:
.LM10:
    ldi r22,0  ;  D.1553   ;  120 movqi_insn/1  [length = 1]
  74:	60 e0       	ldi	r22, 0x00	; 0
    ldi r23,0  ;  D.1553   ;  121 movqi_insn/1  [length = 1]
  76:	70 e0       	ldi	r23, 0x00	; 0
    ldi r24,0  ;  D.1553   ;  122 movqi_insn/1  [length = 1]
  78:	80 e0       	ldi	r24, 0x00	; 0
    ldi r25,0  ;  D.1553   ;  123 movqi_insn/1  [length = 1]
  7a:	90 e0       	ldi	r25, 0x00	; 0
/* epilogue start */
.LM11:
    pop r17  ;   ;  138 popqi [length = 1]
  7c:	1f 91       	pop	r17
    pop r16  ;   ;  139 popqi [length = 1]
  7e:	0f 91       	pop	r16
    pop r15  ;   ;  140 popqi [length = 1]
  80:	ff 90       	pop	r15
    pop r14  ;   ;  141 popqi [length = 1]
  82:	ef 90       	pop	r14
    pop r13  ;   ;  142 popqi [length = 1]
  84:	df 90       	pop	r13
    pop r12  ;   ;  143 popqi [length = 1]
  86:	cf 90       	pop	r12
    ret  ;  144 return_from_epilogue  [length = 1]
  88:	08 95       	ret

WInterrupts.c.o:     file format elf32-avr

Sections:
Idx Name          Size      VMA       LMA       File off  Algn
  0 .text         00000000  00000000  00000000  00000034  2**0
                  CONTENTS, ALLOC, LOAD, READONLY, CODE
  1 .data         00000000  00000000  00000000  00000034  2**0
                  CONTENTS, ALLOC, LOAD, DATA
  2 .bss          00000000  00000000  00000000  00000034  2**0
                  ALLOC
  3 .gnu.lto_.profile.c756f3ce92efa951 00000015  00000000  00000000  00000034  2**0
                  CONTENTS, READONLY, EXCLUDE
  4 .gnu.lto_.jmpfuncs.c756f3ce92efa951 00000046  00000000  00000000  00000049  2**0
                  CONTENTS, READONLY, EXCLUDE
  5 .gnu.lto_.inline.c756f3ce92efa951 00000153  00000000  00000000  0000008f  2**0
                  CONTENTS, READONLY, EXCLUDE
  6 .gnu.lto_.pureconst.c756f3ce92efa951 0000002a  00000000  00000000  000001e2  2**0
                  CONTENTS, READONLY, EXCLUDE
  7 .gnu.lto_nothing.c756f3ce92efa951 000000d4  00000000  00000000  0000020c  2**0
                  CONTENTS, READONLY, EXCLUDE
  8 .gnu.lto_attachInterrupt.part.0.c756f3ce92efa951 00000751  00000000  00000000  000002e0  2**0
                  CONTENTS, READONLY, EXCLUDE
  9 .gnu.lto_attachInterrupt.c756f3ce92efa951 000001f9  00000000  00000000  00000a31  2**0
                  CONTENTS, READONLY, EXCLUDE
 10 .gnu.lto_detachInterrupt.part.1.c756f3ce92efa951 0000045e  00000000  00000000  00000c2a  2**0
                  CONTENTS, READONLY, EXCLUDE
 11 .gnu.lto_detachInterrupt.c756f3ce92efa951 00000173  00000000  00000000  00001088  2**0
                  CONTENTS, READONLY, EXCLUDE
 12 .gnu.lto___vector_1.c756f3ce92efa951 00000144  00000000  00000000  000011fb  2**0
                  CONTENTS, READONLY, EXCLUDE
 13 .gnu.lto___vector_2.c756f3ce92efa951 00000139  00000000  00000000  0000133f  2**0
                  CONTENTS, READONLY, EXCLUDE
 14 .gnu.lto___vector_3.c756f3ce92efa951 00000145  00000000  00000000  00001478  2**0
                  CONTENTS, READONLY, EXCLUDE
 15 .gnu.lto___vector_4.c756f3ce92efa951 00000145  00000000  00000000  000015bd  2**0
                  CONTENTS, READONLY, EXCLUDE
 16 .gnu.lto___vector_5.c756f3ce92efa951 00000139  00000000  00000000  00001702  2**0
                  CONTENTS, READONLY, EXCLUDE
 17 .gnu.lto___vector_6.c756f3ce92efa951 00000139  00000000  00000000  0000183b  2**0
                  CONTENTS, READONLY, EXCLUDE
 18 .gnu.lto___vector_7.c756f3ce92efa951 00000145  00000000  00000000  00001974  2**0
                  CONTENTS, READONLY, EXCLUDE
 19 .gnu.lto___vector_8.c756f3ce92efa951 00000146  00000000  00000000  00001ab9  2**0
                  CONTENTS, READONLY, EXCLUDE
 20 .gnu.lto_.symbol_nodes.c756f3ce92efa951 0000008f  00000000  00000000  00001bff  2**0
                  CONTENTS, READONLY, EXCLUDE
 21 .gnu.lto_.refs.c756f3ce92efa951 00000034  00000000  00000000  00001c8e  2**0
                  CONTENTS, READONLY, EXCLUDE
 22 .gnu.lto_.decls.c756f3ce92efa951 000008a0  00000000  00000000  00001cc2  2**0
                  CONTENTS, READONLY, EXCLUDE
 23 .gnu.lto_.symtab.c756f3ce92efa951 0000010e  00000000  00000000  00002562  2**0
                  CONTENTS, READONLY, EXCLUDE
 24 .gnu.lto_.opts 00000090  00000000  00000000  00002670  2**0
                  CONTENTS, READONLY, EXCLUDE
 25 .comment      00000012  00000000  00000000  00002700  2**0
                  CONTENTS, READONLY

hooks.c.o:     file format elf32-avr

Sections:
Idx Name          Size      VMA       LMA       File off  Algn
  0 .text         00000000  00000000  00000000  00000034  2**0
                  CONTENTS, ALLOC, LOAD, READONLY, CODE
  1 .data         00000000  00000000  00000000  00000034  2**0
                  CONTENTS, ALLOC, LOAD, DATA
  2 .bss          00000000  00000000  00000000  00000034  2**0
                  ALLOC
  3 .gnu.lto_.profile.8aabc12277002ddb 00000013  00000000  00000000  00000034  2**0
                  CONTENTS, READONLY, EXCLUDE
  4 .gnu.lto_.jmpfuncs.8aabc12277002ddb 00000011  00000000  00000000  00000047  2**0
                  CONTENTS, READONLY, EXCLUDE
  5 .gnu.lto_.inline.8aabc12277002ddb 0000001e  00000000  00000000  00000058  2**0
                  CONTENTS, READONLY, EXCLUDE
  6 .gnu.lto_.pureconst.8aabc12277002ddb 00000014  00000000  00000000  00000076  2**0
                  CONTENTS, READONLY, EXCLUDE
  7 .gnu.lto___empty.8aabc12277002ddb 000000ce  00000000  00000000  0000008a  2**0
                  CONTENTS, READONLY, EXCLUDE
  8 .gnu.lto_.symbol_nodes.8aabc12277002ddb 0000002c  00000000  00000000  00000158  2**0
                  CONTENTS, READONLY, EXCLUDE
  9 .gnu.lto_.refs.8aabc12277002ddb 00000014  00000000  00000000  00000184  2**0
                  CONTENTS, READONLY, EXCLUDE
 10 .gnu.lto_.decls.8aabc12277002ddb 00000265  00000000  00000000  00000198  2**0
                  CONTENTS, READONLY, EXCLUDE
 11 .gnu.lto_.symtab.8aabc12277002ddb 00000015  00000000  00000000  000003fd  2**0
                  CONTENTS, READONLY, EXCLUDE
 12 .gnu.lto_.opts 00000090  00000000  00000000  00000412  2**0
                  CONTENTS, READONLY, EXCLUDE
 13 .comment      00000012  00000000  00000000  000004a2  2**0
                  CONTENTS, READONLY

wiring.c.o:     file format elf32-avr

Sections:
Idx Name          Size      VMA       LMA       File off  Algn
  0 .text         00000000  00000000  00000000  00000034  2**0
                  CONTENTS, ALLOC, LOAD, READONLY, CODE
  1 .data         00000000  00000000  00000000  00000034  2**0
                  CONTENTS, ALLOC, LOAD, DATA
  2 .bss          00000000  00000000  00000000  00000034  2**0
                  ALLOC
  3 .gnu.lto_.profile.609c0477dfe49d87 00000015  00000000  00000000  00000034  2**0
                  CONTENTS, READONLY, EXCLUDE
  4 .gnu.lto_.jmpfuncs.609c0477dfe49d87 00000021  00000000  00000000  00000049  2**0
                  CONTENTS, READONLY, EXCLUDE
  5 .gnu.lto_.inline.609c0477dfe49d87 00000095  00000000  00000000  0000006a  2**0
                  CONTENTS, READONLY, EXCLUDE
  6 .gnu.lto_.pureconst.609c0477dfe49d87 0000001c  00000000  00000000  000000ff  2**0
                  CONTENTS, READONLY, EXCLUDE
  7 .gnu.lto___vector_23.609c0477dfe49d87 00000301  00000000  00000000  0000011b  2**0
                  CONTENTS, READONLY, EXCLUDE
  8 .gnu.lto_millis.609c0477dfe49d87 0000023a  00000000  00000000  0000041c  2**0
                  CONTENTS, READONLY, EXCLUDE
  9 .gnu.lto_micros.609c0477dfe49d87 0000039b  00000000  00000000  00000656  2**0
                  CONTENTS, READONLY, EXCLUDE
 10 .gnu.lto_delay.609c0477dfe49d87 000002fd  00000000  00000000  000009f1  2**0
                  CONTENTS, READONLY, EXCLUDE
 11 .gnu.lto_delayMicroseconds.609c0477dfe49d87 00000224  00000000  00000000  00000cee  2**0
                  CONTENTS, READONLY, EXCLUDE
 12 .gnu.lto_init.609c0477dfe49d87 0000052d  00000000  00000000  00000f12  2**0
                  CONTENTS, READONLY, EXCLUDE
 13 .gnu.lto_.symbol_nodes.609c0477dfe49d87 00000071  00000000  00000000  0000143f  2**0
                  CONTENTS, READONLY, EXCLUDE
 14 .gnu.lto_.refs.609c0477dfe49d87 00000029  00000000  00000000  000014b0  2**0
                  CONTENTS, READONLY, EXCLUDE
 15 .gnu.lto_.decls.609c0477dfe49d87 00000670  00000000  00000000  000014d9  2**0
                  CONTENTS, READONLY, EXCLUDE
 16 .gnu.lto_.symtab.609c0477dfe49d87 000000e8  00000000  00000000  00001b49  2**0
                  CONTENTS, READONLY, EXCLUDE
 17 .gnu.lto_.opts 00000090  00000000  00000000  00001c31  2**0
                  CONTENTS, READONLY, EXCLUDE
 18 .comment      00000012  00000000  00000000  00001cc1  2**0
                  CONTENTS, READONLY

wiring_analog.c.o:     file format elf32-avr

Sections:
Idx Name          Size      VMA       LMA       File off  Algn
  0 .text         00000000  00000000  00000000  00000034  2**0
                  CONTENTS, ALLOC, LOAD, READONLY, CODE
  1 .data         00000000  00000000  00000000  00000034  2**0
                  CONTENTS, ALLOC, LOAD, DATA
  2 .bss          00000000  00000000  00000000  00000034  2**0
                  ALLOC
  3 .gnu.lto_.profile.5872a5db9c86a288 00000015  00000000  00000000  00000034  2**0
                  CONTENTS, READONLY, EXCLUDE
  4 .gnu.lto_.jmpfuncs.5872a5db9c86a288 0000004b  00000000  00000000  00000049  2**0
                  CONTENTS, READONLY, EXCLUDE
  5 .gnu.lto_.inline.5872a5db9c86a288 000000ce  00000000  00000000  00000094  2**0
                  CONTENTS, READONLY, EXCLUDE
  6 .gnu.lto_.pureconst.5872a5db9c86a288 00000016  00000000  00000000  00000162  2**0
                  CONTENTS, READONLY, EXCLUDE
  7 .gnu.lto_analogReference.5872a5db9c86a288 0000015a  00000000  00000000  00000178  2**0
                  CONTENTS, READONLY, EXCLUDE
  8 .gnu.lto_analogRead.5872a5db9c86a288 00000496  00000000  00000000  000002d2  2**0
                  CONTENTS, READONLY, EXCLUDE
  9 .gnu.lto_analogWrite.5872a5db9c86a288 00000b35  00000000  00000000  00000768  2**0
                  CONTENTS, READONLY, EXCLUDE
 10 .gnu.lto_.symbol_nodes.5872a5db9c86a288 00000069  00000000  00000000  0000129d  2**0
                  CONTENTS, READONLY, EXCLUDE
 11 .gnu.lto_.refs.5872a5db9c86a288 0000001e  00000000  00000000  00001306  2**0
                  CONTENTS, READONLY, EXCLUDE
 12 .gnu.lto_.decls.5872a5db9c86a288 000006b0  00000000  00000000  00001324  2**0
                  CONTENTS, READONLY, EXCLUDE
 13 .gnu.lto_.symtab.5872a5db9c86a288 000000cf  00000000  00000000  000019d4  2**0
                  CONTENTS, READONLY, EXCLUDE
 14 .gnu.lto_.opts 00000090  00000000  00000000  00001aa3  2**0
                  CONTENTS, READONLY, EXCLUDE
 15 .comment      00000012  00000000  00000000  00001b33  2**0
                  CONTENTS, READONLY

wiring_digital.c.o:     file format elf32-avr

Sections:
Idx Name          Size      VMA       LMA       File off  Algn
  0 .text         00000000  00000000  00000000  00000034  2**0
                  CONTENTS, ALLOC, LOAD, READONLY, CODE
  1 .data         00000000  00000000  00000000  00000034  2**0
                  CONTENTS, ALLOC, LOAD, DATA
  2 .bss          00000000  00000000  00000000  00000034  2**0
                  ALLOC
  3 .gnu.lto_.profile.fd15107ab8a88d44 00000015  00000000  00000000  00000034  2**0
                  CONTENTS, READONLY, EXCLUDE
  4 .gnu.lto_.jmpfuncs.fd15107ab8a88d44 00000025  00000000  00000000  00000049  2**0
                  CONTENTS, READONLY, EXCLUDE
  5 .gnu.lto_.inline.fd15107ab8a88d44 000001a8  00000000  00000000  0000006e  2**0
                  CONTENTS, READONLY, EXCLUDE
  6 .gnu.lto_.pureconst.fd15107ab8a88d44 00000018  00000000  00000000  00000216  2**0
                  CONTENTS, READONLY, EXCLUDE
  7 .gnu.lto_turnOffPWM.fd15107ab8a88d44 00000628  00000000  00000000  0000022e  2**0
                  CONTENTS, READONLY, EXCLUDE
  8 .gnu.lto_pinMode.fd15107ab8a88d44 000007fd  00000000  00000000  00000856  2**0
                  CONTENTS, READONLY, EXCLUDE
  9 .gnu.lto_digitalWrite.fd15107ab8a88d44 000006e2  00000000  00000000  00001053  2**0
                  CONTENTS, READONLY, EXCLUDE
 10 .gnu.lto_digitalRead.fd15107ab8a88d44 000005c0  00000000  00000000  00001735  2**0
                  CONTENTS, READONLY, EXCLUDE
 11 .gnu.lto_.symbol_nodes.fd15107ab8a88d44 0000005d  00000000  00000000  00001cf5  2**0
                  CONTENTS, READONLY, EXCLUDE
 12 .gnu.lto_.refs.fd15107ab8a88d44 0000002d  00000000  00000000  00001d52  2**0
                  CONTENTS, READONLY, EXCLUDE
 13 .gnu.lto_.decls.fd15107ab8a88d44 00000e90  00000000  00000000  00001d7f  2**0
                  CONTENTS, READONLY, EXCLUDE
 14 .gnu.lto_.symtab.fd15107ab8a88d44 0000012b  00000000  00000000  00002c0f  2**0
                  CONTENTS, READONLY, EXCLUDE
 15 .gnu.lto_.opts 00000090  00000000  00000000  00002d3a  2**0
                  CONTENTS, READONLY, EXCLUDE
 16 .comment      00000012  00000000  00000000  00002dca  2**0
                  CONTENTS, READONLY

wiring_pulse.c.o:     file format elf32-avr

Sections:
Idx Name          Size      VMA       LMA       File off  Algn
  0 .text         00000000  00000000  00000000  00000034  2**0
                  CONTENTS, ALLOC, LOAD, READONLY, CODE
  1 .data         00000000  00000000  00000000  00000034  2**0
                  CONTENTS, ALLOC, LOAD, DATA
  2 .bss          00000000  00000000  00000000  00000034  2**0
                  ALLOC
  3 .gnu.lto_.profile.896f234b61f08bf 00000014  00000000  00000000  00000034  2**0
                  CONTENTS, READONLY, EXCLUDE
  4 .gnu.lto_.jmpfuncs.896f234b61f08bf 00000020  00000000  00000000  00000048  2**0
                  CONTENTS, READONLY, EXCLUDE
  5 .gnu.lto_.inline.896f234b61f08bf 00000073  00000000  00000000  00000068  2**0
                  CONTENTS, READONLY, EXCLUDE
  6 .gnu.lto_.pureconst.896f234b61f08bf 00000014  00000000  00000000  000000db  2**0
                  CONTENTS, READONLY, EXCLUDE
  7 .gnu.lto_pulseIn.896f234b61f08bf 0000062b  00000000  00000000  000000ef  2**0
                  CONTENTS, READONLY, EXCLUDE
  8 .gnu.lto_pulseInLong.896f234b61f08bf 0000082f  00000000  00000000  0000071a  2**0
                  CONTENTS, READONLY, EXCLUDE
  9 .gnu.lto_.symbol_nodes.896f234b61f08bf 00000070  00000000  00000000  00000f49  2**0
                  CONTENTS, READONLY, EXCLUDE
 10 .gnu.lto_.refs.896f234b61f08bf 00000020  00000000  00000000  00000fb9  2**0
                  CONTENTS, READONLY, EXCLUDE
 11 .gnu.lto_.decls.896f234b61f08bf 00000611  00000000  00000000  00000fd9  2**0
                  CONTENTS, READONLY, EXCLUDE
 12 .gnu.lto_.symtab.896f234b61f08bf 000000d8  00000000  00000000  000015ea  2**0
                  CONTENTS, READONLY, EXCLUDE
 13 .gnu.lto_.opts 00000090  00000000  00000000  000016c2  2**0
                  CONTENTS, READONLY, EXCLUDE
 14 .comment      00000012  00000000  00000000  00001752  2**0
                  CONTENTS, READONLY

wiring_shift.c.o:     file format elf32-avr

Sections:
Idx Name          Size      VMA       LMA       File off  Algn
  0 .text         00000000  00000000  00000000  00000034  2**0
                  CONTENTS, ALLOC, LOAD, READONLY, CODE
  1 .data         00000000  00000000  00000000  00000034  2**0
                  CONTENTS, ALLOC, LOAD, DATA
  2 .bss          00000000  00000000  00000000  00000034  2**0
                  ALLOC
  3 .gnu.lto_.profile.d2381a0f3a5dda69 00000013  00000000  00000000  00000034  2**0
                  CONTENTS, READONLY, EXCLUDE
  4 .gnu.lto_.jmpfuncs.d2381a0f3a5dda69 0000005c  00000000  00000000  00000047  2**0
                  CONTENTS, READONLY, EXCLUDE
  5 .gnu.lto_.inline.d2381a0f3a5dda69 00000086  00000000  00000000  000000a3  2**0
                  CONTENTS, READONLY, EXCLUDE
  6 .gnu.lto_.pureconst.d2381a0f3a5dda69 00000014  00000000  00000000  00000129  2**0
                  CONTENTS, READONLY, EXCLUDE
  7 .gnu.lto_shiftIn.d2381a0f3a5dda69 000003c1  00000000  00000000  0000013d  2**0
                  CONTENTS, READONLY, EXCLUDE
  8 .gnu.lto_shiftOut.d2381a0f3a5dda69 0000035a  00000000  00000000  000004fe  2**0
                  CONTENTS, READONLY, EXCLUDE
  9 .gnu.lto_.symbol_nodes.d2381a0f3a5dda69 00000064  00000000  00000000  00000858  2**0
                  CONTENTS, READONLY, EXCLUDE
 10 .gnu.lto_.refs.d2381a0f3a5dda69 0000000f  00000000  00000000  000008bc  2**0
                  CONTENTS, READONLY, EXCLUDE
 11 .gnu.lto_.decls.d2381a0f3a5dda69 0000038b  00000000  00000000  000008cb  2**0
                  CONTENTS, READONLY, EXCLUDE
 12 .gnu.lto_.symtab.d2381a0f3a5dda69 00000066  00000000  00000000  00000c56  2**0
                  CONTENTS, READONLY, EXCLUDE
 13 .gnu.lto_.opts 00000090  00000000  00000000  00000cbc  2**0
                  CONTENTS, READONLY, EXCLUDE
 14 .comment      00000012  00000000  00000000  00000d4c  2**0
                  CONTENTS, READONLY

CDC.cpp.o:     file format elf32-avr

Sections:
Idx Name          Size      VMA       LMA       File off  Algn
  0 .text         00000000  00000000  00000000  00000034  2**0
                  CONTENTS, ALLOC, LOAD, READONLY, CODE
  1 .data         00000000  00000000  00000000  00000034  2**0
                  CONTENTS, ALLOC, LOAD, DATA
  2 .bss          00000000  00000000  00000000  00000034  2**0
                  ALLOC
  3 .gnu.lto_.profile.29931066b305d7ae 0000000f  00000000  00000000  00000034  2**0
                  CONTENTS, READONLY, EXCLUDE
  4 .gnu.lto_.inline.29931066b305d7ae 0000000e  00000000  00000000  00000043  2**0
                  CONTENTS, READONLY, EXCLUDE
  5 .gnu.lto_.pureconst.29931066b305d7ae 0000000f  00000000  00000000  00000051  2**0
                  CONTENTS, READONLY, EXCLUDE
  6 .gnu.lto_.symbol_nodes.29931066b305d7ae 0000000f  00000000  00000000  00000060  2**0
                  CONTENTS, READONLY, EXCLUDE
  7 .gnu.lto_.refs.29931066b305d7ae 0000000f  00000000  00000000  0000006f  2**0
                  CONTENTS, READONLY, EXCLUDE
  8 .gnu.lto_.decls.29931066b305d7ae 0000001a  00000000  00000000  0000007e  2**0
                  CONTENTS, READONLY, EXCLUDE
  9 .gnu.lto_.symtab.29931066b305d7ae 00000000  00000000  00000000  00000098  2**0
                  CONTENTS, READONLY, EXCLUDE
 10 .gnu.lto_.opts 00000099  00000000  00000000  00000098  2**0
                  CONTENTS, READONLY, EXCLUDE
 11 .comment      00000012  00000000  00000000  00000131  2**0
                  CONTENTS, READONLY

HardwareSerial.cpp.o:     file format elf32-avr

Sections:
Idx Name          Size      VMA       LMA       File off  Algn
  0 .text         00000000  00000000  00000000  00000034  2**0
                  CONTENTS, ALLOC, LOAD, READONLY, CODE
  1 .data         00000000  00000000  00000000  00000034  2**0
                  CONTENTS, ALLOC, LOAD, DATA
  2 .bss          00000000  00000000  00000000  00000034  2**0
                  ALLOC
  3 .gnu.lto_.profile.369b0a5a4b59a30d 00000015  00000000  00000000  00000034  2**0
                  CONTENTS, READONLY, EXCLUDE
  4 .gnu.lto_.jmpfuncs.369b0a5a4b59a30d 00000054  00000000  00000000  00000049  2**0
                  CONTENTS, READONLY, EXCLUDE
  5 .gnu.lto_.inline.369b0a5a4b59a30d 000001b7  00000000  00000000  0000009d  2**0
                  CONTENTS, READONLY, EXCLUDE
  6 .gnu.lto_.pureconst.369b0a5a4b59a30d 0000002a  00000000  00000000  00000254  2**0
                  CONTENTS, READONLY, EXCLUDE
  7 .gnu.lto__ZN14HardwareSerial9availableEv.369b0a5a4b59a30d 000001e1  00000000  00000000  0000027e  2**0
                  CONTENTS, READONLY, EXCLUDE
  8 .gnu.lto__ZN14HardwareSerial4peekEv.369b0a5a4b59a30d 0000021d  00000000  00000000  0000045f  2**0
                  CONTENTS, READONLY, EXCLUDE
  9 .gnu.lto__ZN14HardwareSerial4readEv.369b0a5a4b59a30d 000002be  00000000  00000000  0000067c  2**0
                  CONTENTS, READONLY, EXCLUDE
 10 .gnu.lto__ZN14HardwareSerial17availableForWriteEv.369b0a5a4b59a30d 000002b0  00000000  00000000  0000093a  2**0
                  CONTENTS, READONLY, EXCLUDE
 11 .gnu.lto__ZN14HardwareSerial17_tx_udr_empty_irqEv.part.0.369b0a5a4b59a30d 00000211  00000000  00000000  00000bea  2**0
                  CONTENTS, READONLY, EXCLUDE
 12 .gnu.lto__ZN14HardwareSerial17_tx_udr_empty_irqEv.369b0a5a4b59a30d 0000034b  00000000  00000000  00000dfb  2**0
                  CONTENTS, READONLY, EXCLUDE
 13 .gnu.lto__Z14serialEventRunv.369b0a5a4b59a30d 00000335  00000000  00000000  00001146  2**0
                  CONTENTS, READONLY, EXCLUDE
 14 .gnu.lto__ZN14HardwareSerial5flushEv.part.1.369b0a5a4b59a30d 000003ba  00000000  00000000  0000147b  2**0
                  CONTENTS, READONLY, EXCLUDE
 15 .gnu.lto__ZN14HardwareSerial5flushEv.369b0a5a4b59a30d 000001cc  00000000  00000000  00001835  2**0
                  CONTENTS, READONLY, EXCLUDE
 16 .gnu.lto__ZN14HardwareSerial5writeEh.part.2.369b0a5a4b59a30d 00000438  00000000  00000000  00001a01  2**0
                  CONTENTS, READONLY, EXCLUDE
 17 .gnu.lto__ZN14HardwareSerial5writeEh.369b0a5a4b59a30d 000003a3  00000000  00000000  00001e39  2**0
                  CONTENTS, READONLY, EXCLUDE
 18 .gnu.lto__ZN14HardwareSerial5beginEmh.369b0a5a4b59a30d 0000053c  00000000  00000000  000021dc  2**0
                  CONTENTS, READONLY, EXCLUDE
 19 .gnu.lto__ZN14HardwareSerial3endEv.369b0a5a4b59a30d 00000328  00000000  00000000  00002718  2**0
                  CONTENTS, READONLY, EXCLUDE
 20 .gnu.lto_.symbol_nodes.369b0a5a4b59a30d 000000ff  00000000  00000000  00002a40  2**0
                  CONTENTS, READONLY, EXCLUDE
 21 .gnu.lto_.refs.369b0a5a4b59a30d 00000036  00000000  00000000  00002b3f  2**0
                  CONTENTS, READONLY, EXCLUDE
 22 .gnu.lto_.decls.369b0a5a4b59a30d 00001391  00000000  00000000  00002b75  2**0
                  CONTENTS, READONLY, EXCLUDE
 23 .gnu.lto_.symtab.369b0a5a4b59a30d 00000338  00000000  00000000  00003f06  2**0
                  CONTENTS, READONLY, EXCLUDE
 24 .gnu.lto_.opts 00000099  00000000  00000000  0000423e  2**0
                  CONTENTS, READONLY, EXCLUDE
 25 .comment      00000012  00000000  00000000  000042d7  2**0
                  CONTENTS, READONLY

HardwareSerial0.cpp.o:     file format elf32-avr

Sections:
Idx Name          Size      VMA       LMA       File off  Algn
  0 .text         00000000  00000000  00000000  00000034  2**0
                  CONTENTS, ALLOC, LOAD, READONLY, CODE
  1 .data         00000000  00000000  00000000  00000034  2**0
                  CONTENTS, ALLOC, LOAD, DATA
  2 .bss          00000000  00000000  00000000  00000034  2**0
                  ALLOC
  3 .gnu.lto_.profile.cbd66a14bc19e38a 00000013  00000000  00000000  00000034  2**0
                  CONTENTS, READONLY, EXCLUDE
  4 .gnu.lto_.jmpfuncs.cbd66a14bc19e38a 00000061  00000000  00000000  00000047  2**0
                  CONTENTS, READONLY, EXCLUDE
  5 .gnu.lto_.inline.cbd66a14bc19e38a 000000d0  00000000  00000000  000000a8  2**0
                  CONTENTS, READONLY, EXCLUDE
  6 .gnu.lto_.pureconst.cbd66a14bc19e38a 00000022  00000000  00000000  00000178  2**0
                  CONTENTS, READONLY, EXCLUDE
  7 .gnu.lto__ZN5Print17availableForWriteEv.cbd66a14bc19e38a 00000126  00000000  00000000  0000019a  2**0
                  CONTENTS, READONLY, EXCLUDE
  8 .gnu.lto__ZN5Print5flushEv.cbd66a14bc19e38a 00000122  00000000  00000000  000002c0  2**0
                  CONTENTS, READONLY, EXCLUDE
  9 .gnu.lto__Z41__static_initialization_and_destruction_0ii.cbd66a14bc19e38a 0000064e  00000000  00000000  000003e2  2**0
                  CONTENTS, READONLY, EXCLUDE
 10 .gnu.lto__ZN14HardwareSerial16_rx_complete_irqEv.part.0.cbd66a14bc19e38a 0000030e  00000000  00000000  00000a30  2**0
                  CONTENTS, READONLY, EXCLUDE
 11 .gnu.lto__ZN14HardwareSerial16_rx_complete_irqEv.cbd66a14bc19e38a 00000240  00000000  00000000  00000d3e  2**0
                  CONTENTS, READONLY, EXCLUDE
 12 .gnu.lto___vector_25.cbd66a14bc19e38a 0000013f  00000000  00000000  00000f7e  2**0
                  CONTENTS, READONLY, EXCLUDE
 13 .gnu.lto___vector_26.cbd66a14bc19e38a 0000013d  00000000  00000000  000010bd  2**0
                  CONTENTS, READONLY, EXCLUDE
 14 .gnu.lto__Z17Serial0_availablev.cbd66a14bc19e38a 00000158  00000000  00000000  000011fa  2**0
                  CONTENTS, READONLY, EXCLUDE
 15 .gnu.lto__GLOBAL__sub_I___vector_25.cbd66a14bc19e38a 000000fc  00000000  00000000  00001352  2**0
                  CONTENTS, READONLY, EXCLUDE
 16 .gnu.lto_.symbol_nodes.cbd66a14bc19e38a 000000c4  00000000  00000000  0000144e  2**0
                  CONTENTS, READONLY, EXCLUDE
 17 .gnu.lto_.refs.cbd66a14bc19e38a 00000059  00000000  00000000  00001512  2**0
                  CONTENTS, READONLY, EXCLUDE
 18 .gnu.lto_.decls.cbd66a14bc19e38a 00001447  00000000  00000000  0000156b  2**0
                  CONTENTS, READONLY, EXCLUDE
 19 .gnu.lto_.symtab.cbd66a14bc19e38a 0000025f  00000000  00000000  000029b2  2**0
                  CONTENTS, READONLY, EXCLUDE
 20 .gnu.lto_.opts 00000099  00000000  00000000  00002c11  2**0
                  CONTENTS, READONLY, EXCLUDE
 21 .comment      00000012  00000000  00000000  00002caa  2**0
                  CONTENTS, READONLY

HardwareSerial1.cpp.o:     file format elf32-avr

Sections:
Idx Name          Size      VMA       LMA       File off  Algn
  0 .text         00000000  00000000  00000000  00000034  2**0
                  CONTENTS, ALLOC, LOAD, READONLY, CODE
  1 .data         00000000  00000000  00000000  00000034  2**0
                  CONTENTS, ALLOC, LOAD, DATA
  2 .bss          00000000  00000000  00000000  00000034  2**0
                  ALLOC
  3 .gnu.lto_.profile.25419ddc939b9827 00000013  00000000  00000000  00000034  2**0
                  CONTENTS, READONLY, EXCLUDE
  4 .gnu.lto_.jmpfuncs.25419ddc939b9827 00000061  00000000  00000000  00000047  2**0
                  CONTENTS, READONLY, EXCLUDE
  5 .gnu.lto_.inline.25419ddc939b9827 000000d0  00000000  00000000  000000a8  2**0
                  CONTENTS, READONLY, EXCLUDE
  6 .gnu.lto_.pureconst.25419ddc939b9827 00000022  00000000  00000000  00000178  2**0
                  CONTENTS, READONLY, EXCLUDE
  7 .gnu.lto__ZN5Print17availableForWriteEv.25419ddc939b9827 00000126  00000000  00000000  0000019a  2**0
                  CONTENTS, READONLY, EXCLUDE
  8 .gnu.lto__ZN5Print5flushEv.25419ddc939b9827 00000122  00000000  00000000  000002c0  2**0
                  CONTENTS, READONLY, EXCLUDE
  9 .gnu.lto__Z41__static_initialization_and_destruction_0ii.25419ddc939b9827 0000064c  00000000  00000000  000003e2  2**0
                  CONTENTS, READONLY, EXCLUDE
 10 .gnu.lto__ZN14HardwareSerial16_rx_complete_irqEv.part.0.25419ddc939b9827 0000030e  00000000  00000000  00000a2e  2**0
                  CONTENTS, READONLY, EXCLUDE
 11 .gnu.lto__ZN14HardwareSerial16_rx_complete_irqEv.25419ddc939b9827 00000240  00000000  00000000  00000d3c  2**0
                  CONTENTS, READONLY, EXCLUDE
 12 .gnu.lto___vector_36.25419ddc939b9827 0000013d  00000000  00000000  00000f7c  2**0
                  CONTENTS, READONLY, EXCLUDE
 13 .gnu.lto___vector_37.25419ddc939b9827 0000013b  00000000  00000000  000010b9  2**0
                  CONTENTS, READONLY, EXCLUDE
 14 .gnu.lto__Z17Serial1_availablev.25419ddc939b9827 00000158  00000000  00000000  000011f4  2**0
                  CONTENTS, READONLY, EXCLUDE
 15 .gnu.lto__GLOBAL__sub_I___vector_36.25419ddc939b9827 000000fc  00000000  00000000  0000134c  2**0
                  CONTENTS, READONLY, EXCLUDE
 16 .gnu.lto_.symbol_nodes.25419ddc939b9827 000000c4  00000000  00000000  00001448  2**0
                  CONTENTS, READONLY, EXCLUDE
 17 .gnu.lto_.refs.25419ddc939b9827 00000059  00000000  00000000  0000150c  2**0
                  CONTENTS, READONLY, EXCLUDE
 18 .gnu.lto_.decls.25419ddc939b9827 00001449  00000000  00000000  00001565  2**0
                  CONTENTS, READONLY, EXCLUDE
 19 .gnu.lto_.symtab.25419ddc939b9827 00000260  00000000  00000000  000029ae  2**0
                  CONTENTS, READONLY, EXCLUDE
 20 .gnu.lto_.opts 00000099  00000000  00000000  00002c0e  2**0
                  CONTENTS, READONLY, EXCLUDE
 21 .comment      00000012  00000000  00000000  00002ca7  2**0
                  CONTENTS, READONLY

HardwareSerial2.cpp.o:     file format elf32-avr

Sections:
Idx Name          Size      VMA       LMA       File off  Algn
  0 .text         00000000  00000000  00000000  00000034  2**0
                  CONTENTS, ALLOC, LOAD, READONLY, CODE
  1 .data         00000000  00000000  00000000  00000034  2**0
                  CONTENTS, ALLOC, LOAD, DATA
  2 .bss          00000000  00000000  00000000  00000034  2**0
                  ALLOC
  3 .gnu.lto_.profile.5daa1c0a13551cd9 00000013  00000000  00000000  00000034  2**0
                  CONTENTS, READONLY, EXCLUDE
  4 .gnu.lto_.jmpfuncs.5daa1c0a13551cd9 00000061  00000000  00000000  00000047  2**0
                  CONTENTS, READONLY, EXCLUDE
  5 .gnu.lto_.inline.5daa1c0a13551cd9 000000d0  00000000  00000000  000000a8  2**0
                  CONTENTS, READONLY, EXCLUDE
  6 .gnu.lto_.pureconst.5daa1c0a13551cd9 00000022  00000000  00000000  00000178  2**0
                  CONTENTS, READONLY, EXCLUDE
  7 .gnu.lto__ZN5Print17availableForWriteEv.5daa1c0a13551cd9 00000126  00000000  00000000  0000019a  2**0
                  CONTENTS, READONLY, EXCLUDE
  8 .gnu.lto__ZN5Print5flushEv.5daa1c0a13551cd9 00000122  00000000  00000000  000002c0  2**0
                  CONTENTS, READONLY, EXCLUDE
  9 .gnu.lto__Z41__static_initialization_and_destruction_0ii.5daa1c0a13551cd9 0000064d  00000000  00000000  000003e2  2**0
                  CONTENTS, READONLY, EXCLUDE
 10 .gnu.lto__ZN14HardwareSerial16_rx_complete_irqEv.part.0.5daa1c0a13551cd9 0000030e  00000000  00000000  00000a2f  2**0
                  CONTENTS, READONLY, EXCLUDE
 11 .gnu.lto__ZN14HardwareSerial16_rx_complete_irqEv.5daa1c0a13551cd9 00000240  00000000  00000000  00000d3d  2**0
                  CONTENTS, READONLY, EXCLUDE
 12 .gnu.lto___vector_51.5daa1c0a13551cd9 0000013e  00000000  00000000  00000f7d  2**0
                  CONTENTS, READONLY, EXCLUDE
 13 .gnu.lto___vector_52.5daa1c0a13551cd9 0000013b  00000000  00000000  000010bb  2**0
                  CONTENTS, READONLY, EXCLUDE
 14 .gnu.lto__Z17Serial2_availablev.5daa1c0a13551cd9 00000155  00000000  00000000  000011f6  2**0
                  CONTENTS, READONLY, EXCLUDE
 15 .gnu.lto__GLOBAL__sub_I___vector_51.5daa1c0a13551cd9 000000fa  00000000  00000000  0000134b  2**0
                  CONTENTS, READONLY, EXCLUDE
 16 .gnu.lto_.symbol_nodes.5daa1c0a13551cd9 000000c4  00000000  00000000  00001445  2**0
                  CONTENTS, READONLY, EXCLUDE
 17 .gnu.lto_.refs.5daa1c0a13551cd9 00000059  00000000  00000000  00001509  2**0
                  CONTENTS, READONLY, EXCLUDE
 18 .gnu.lto_.decls.5daa1c0a13551cd9 00001445  00000000  00000000  00001562  2**0
                  CONTENTS, READONLY, EXCLUDE
 19 .gnu.lto_.symtab.5daa1c0a13551cd9 00000260  00000000  00000000  000029a7  2**0
                  CONTENTS, READONLY, EXCLUDE
 20 .gnu.lto_.opts 00000099  00000000  00000000  00002c07  2**0
                  CONTENTS, READONLY, EXCLUDE
 21 .comment      00000012  00000000  00000000  00002ca0  2**0
                  CONTENTS, READONLY

HardwareSerial3.cpp.o:     file format elf32-avr

Sections:
Idx Name          Size      VMA       LMA       File off  Algn
  0 .text         00000000  00000000  00000000  00000034  2**0
                  CONTENTS, ALLOC, LOAD, READONLY, CODE
  1 .data         00000000  00000000  00000000  00000034  2**0
                  CONTENTS, ALLOC, LOAD, DATA
  2 .bss          00000000  00000000  00000000  00000034  2**0
                  ALLOC
  3 .gnu.lto_.profile.8be95d704147636 00000013  00000000  00000000  00000034  2**0
                  CONTENTS, READONLY, EXCLUDE
  4 .gnu.lto_.jmpfuncs.8be95d704147636 00000061  00000000  00000000  00000047  2**0
                  CONTENTS, READONLY, EXCLUDE
  5 .gnu.lto_.inline.8be95d704147636 000000d0  00000000  00000000  000000a8  2**0
                  CONTENTS, READONLY, EXCLUDE
  6 .gnu.lto_.pureconst.8be95d704147636 00000022  00000000  00000000  00000178  2**0
                  CONTENTS, READONLY, EXCLUDE
  7 .gnu.lto__ZN5Print17availableForWriteEv.8be95d704147636 00000126  00000000  00000000  0000019a  2**0
                  CONTENTS, READONLY, EXCLUDE
  8 .gnu.lto__ZN5Print5flushEv.8be95d704147636 00000122  00000000  00000000  000002c0  2**0
                  CONTENTS, READONLY, EXCLUDE
  9 .gnu.lto__Z41__static_initialization_and_destruction_0ii.8be95d704147636 00000650  00000000  00000000  000003e2  2**0
                  CONTENTS, READONLY, EXCLUDE
 10 .gnu.lto__ZN14HardwareSerial16_rx_complete_irqEv.part.0.8be95d704147636 0000030e  00000000  00000000  00000a32  2**0
                  CONTENTS, READONLY, EXCLUDE
 11 .gnu.lto__ZN14HardwareSerial16_rx_complete_irqEv.8be95d704147636 00000240  00000000  00000000  00000d40  2**0
                  CONTENTS, READONLY, EXCLUDE
 12 .gnu.lto___vector_54.8be95d704147636 0000013e  00000000  00000000  00000f80  2**0
                  CONTENTS, READONLY, EXCLUDE
 13 .gnu.lto___vector_55.8be95d704147636 0000013b  00000000  00000000  000010be  2**0
                  CONTENTS, READONLY, EXCLUDE
 14 .gnu.lto__Z17Serial3_availablev.8be95d704147636 00000155  00000000  00000000  000011f9  2**0
                  CONTENTS, READONLY, EXCLUDE
 15 .gnu.lto__GLOBAL__sub_I___vector_54.8be95d704147636 000000fa  00000000  00000000  0000134e  2**0
                  CONTENTS, READONLY, EXCLUDE
 16 .gnu.lto_.symbol_nodes.8be95d704147636 000000c4  00000000  00000000  00001448  2**0
                  CONTENTS, READONLY, EXCLUDE
 17 .gnu.lto_.refs.8be95d704147636 00000059  00000000  00000000  0000150c  2**0
                  CONTENTS, READONLY, EXCLUDE
 18 .gnu.lto_.decls.8be95d704147636 00001449  00000000  00000000  00001565  2**0
                  CONTENTS, READONLY, EXCLUDE
 19 .gnu.lto_.symtab.8be95d704147636 00000260  00000000  00000000  000029ae  2**0
                  CONTENTS, READONLY, EXCLUDE
 20 .gnu.lto_.opts 00000099  00000000  00000000  00002c0e  2**0
                  CONTENTS, READONLY, EXCLUDE
 21 .comment      00000012  00000000  00000000  00002ca7  2**0
                  CONTENTS, READONLY

IPAddress.cpp.o:     file format elf32-avr

Sections:
Idx Name          Size      VMA       LMA       File off  Algn
  0 .text         00000000  00000000  00000000  00000034  2**0
                  CONTENTS, ALLOC, LOAD, READONLY, CODE
  1 .data         00000000  00000000  00000000  00000034  2**0
                  CONTENTS, ALLOC, LOAD, DATA
  2 .bss          00000000  00000000  00000000  00000034  2**0
                  ALLOC
  3 .gnu.lto_.profile.f9beccb06061965d 00000014  00000000  00000000  00000034  2**0
                  CONTENTS, READONLY, EXCLUDE
  4 .gnu.lto_.jmpfuncs.f9beccb06061965d 00000097  00000000  00000000  00000048  2**0
                  CONTENTS, READONLY, EXCLUDE
  5 .gnu.lto_.inline.f9beccb06061965d 000000e1  00000000  00000000  000000df  2**0
                  CONTENTS, READONLY, EXCLUDE
  6 .gnu.lto_.pureconst.f9beccb06061965d 0000002e  00000000  00000000  000001c0  2**0
                  CONTENTS, READONLY, EXCLUDE
  7 .gnu.lto__Z41__static_initialization_and_destruction_0ii.f9beccb06061965d 00000494  00000000  00000000  000001ee  2**0
                  CONTENTS, READONLY, EXCLUDE
  8 .gnu.lto__ZNK9IPAddress7printToER5Print.f9beccb06061965d 0000039f  00000000  00000000  00000682  2**0
                  CONTENTS, READONLY, EXCLUDE
  9 .gnu.lto__ZN9IPAddressC2Ev.f9beccb06061965d 000002bc  00000000  00000000  00000a21  2**0
                  CONTENTS, READONLY, EXCLUDE
 10 .gnu.lto__ZN9IPAddressC2Ehhhh.f9beccb06061965d 000003d8  00000000  00000000  00000cdd  2**0
                  CONTENTS, READONLY, EXCLUDE
 11 .gnu.lto__ZN9IPAddressC2Em.f9beccb06061965d 000002f6  00000000  00000000  000010b5  2**0
                  CONTENTS, READONLY, EXCLUDE
 12 .gnu.lto__ZN9IPAddressC2EPKh.f9beccb06061965d 0000031a  00000000  00000000  000013ab  2**0
                  CONTENTS, READONLY, EXCLUDE
 13 .gnu.lto__ZN9IPAddress10fromStringEPKc.f9beccb06061965d 0000052c  00000000  00000000  000016c5  2**0
                  CONTENTS, READONLY, EXCLUDE
 14 .gnu.lto__ZN9IPAddressaSEPKh.f9beccb06061965d 000001fc  00000000  00000000  00001bf1  2**0
                  CONTENTS, READONLY, EXCLUDE
 15 .gnu.lto__ZN9IPAddressaSEm.f9beccb06061965d 000001d5  00000000  00000000  00001ded  2**0
                  CONTENTS, READONLY, EXCLUDE
 16 .gnu.lto__ZNK9IPAddresseqEPKh.f9beccb06061965d 0000020d  00000000  00000000  00001fc2  2**0
                  CONTENTS, READONLY, EXCLUDE
 17 .gnu.lto__GLOBAL__sub_I__ZN9IPAddressC2Ev.f9beccb06061965d 000000fa  00000000  00000000  000021cf  2**0
                  CONTENTS, READONLY, EXCLUDE
 18 .gnu.lto_.symbol_nodes.f9beccb06061965d 000000d4  00000000  00000000  000022c9  2**0
                  CONTENTS, READONLY, EXCLUDE
 19 .gnu.lto_.refs.f9beccb06061965d 00000042  00000000  00000000  0000239d  2**0
                  CONTENTS, READONLY, EXCLUDE
 20 .gnu.lto_.decls.f9beccb06061965d 000012a3  00000000  00000000  000023df  2**0
                  CONTENTS, READONLY, EXCLUDE
 21 .gnu.lto_.symtab.f9beccb06061965d 00000292  00000000  00000000  00003682  2**0
                  CONTENTS, READONLY, EXCLUDE
 22 .gnu.lto_.opts 00000099  00000000  00000000  00003914  2**0
                  CONTENTS, READONLY, EXCLUDE
 23 .comment      00000012  00000000  00000000  000039ad  2**0
                  CONTENTS, READONLY

PluggableUSB.cpp.o:     file format elf32-avr

Sections:
Idx Name          Size      VMA       LMA       File off  Algn
  0 .text         00000000  00000000  00000000  00000034  2**0
                  CONTENTS, ALLOC, LOAD, READONLY, CODE
  1 .data         00000000  00000000  00000000  00000034  2**0
                  CONTENTS, ALLOC, LOAD, DATA
  2 .bss          00000000  00000000  00000000  00000034  2**0
                  ALLOC
  3 .gnu.lto_.profile.11fda3b81939b9f4 0000000f  00000000  00000000  00000034  2**0
                  CONTENTS, READONLY, EXCLUDE
  4 .gnu.lto_.inline.11fda3b81939b9f4 0000000e  00000000  00000000  00000043  2**0
                  CONTENTS, READONLY, EXCLUDE
  5 .gnu.lto_.pureconst.11fda3b81939b9f4 0000000f  00000000  00000000  00000051  2**0
                  CONTENTS, READONLY, EXCLUDE
  6 .gnu.lto_.symbol_nodes.11fda3b81939b9f4 0000000f  00000000  00000000  00000060  2**0
                  CONTENTS, READONLY, EXCLUDE
  7 .gnu.lto_.refs.11fda3b81939b9f4 0000000f  00000000  00000000  0000006f  2**0
                  CONTENTS, READONLY, EXCLUDE
  8 .gnu.lto_.decls.11fda3b81939b9f4 0000001a  00000000  00000000  0000007e  2**0
                  CONTENTS, READONLY, EXCLUDE
  9 .gnu.lto_.symtab.11fda3b81939b9f4 00000000  00000000  00000000  00000098  2**0
                  CONTENTS, READONLY, EXCLUDE
 10 .gnu.lto_.opts 00000099  00000000  00000000  00000098  2**0
                  CONTENTS, READONLY, EXCLUDE
 11 .comment      00000012  00000000  00000000  00000131  2**0
                  CONTENTS, READONLY

Print.cpp.o:     file format elf32-avr

Sections:
Idx Name          Size      VMA       LMA       File off  Algn
  0 .text         00000000  00000000  00000000  00000034  2**0
                  CONTENTS, ALLOC, LOAD, READONLY, CODE
  1 .data         00000000  00000000  00000000  00000034  2**0
                  CONTENTS, ALLOC, LOAD, DATA
  2 .bss          00000000  00000000  00000000  00000034  2**0
                  ALLOC
  3 .gnu.lto_.profile.6d7523effbb304cb 00000015  00000000  00000000  00000034  2**0
                  CONTENTS, READONLY, EXCLUDE
  4 .gnu.lto_.jmpfuncs.6d7523effbb304cb 000001e8  00000000  00000000  00000049  2**0
                  CONTENTS, READONLY, EXCLUDE
  5 .gnu.lto_.inline.6d7523effbb304cb 00000284  00000000  00000000  00000231  2**0
                  CONTENTS, READONLY, EXCLUDE
  6 .gnu.lto_.pureconst.6d7523effbb304cb 00000044  00000000  00000000  000004b5  2**0
                  CONTENTS, READONLY, EXCLUDE
  7 .gnu.lto__ZN5Print17availableForWriteEv.6d7523effbb304cb 00000126  00000000  00000000  000004f9  2**0
                  CONTENTS, READONLY, EXCLUDE
  8 .gnu.lto__ZN5Print5flushEv.6d7523effbb304cb 00000122  00000000  00000000  0000061f  2**0
                  CONTENTS, READONLY, EXCLUDE
  9 .gnu.lto__ZN5Print5writeEPKhj.6d7523effbb304cb 0000034f  00000000  00000000  00000741  2**0
                  CONTENTS, READONLY, EXCLUDE
 10 .gnu.lto__ZN5Print5printEmi.part.3.6d7523effbb304cb 00000283  00000000  00000000  00000a90  2**0
                  CONTENTS, READONLY, EXCLUDE
 11 .gnu.lto__ZN5Print5printEmi.6d7523effbb304cb 0000024a  00000000  00000000  00000d13  2**0
                  CONTENTS, READONLY, EXCLUDE
 12 .gnu.lto__ZN5Print5writeEPKc.6d7523effbb304cb 00000253  00000000  00000000  00000f5d  2**0
                  CONTENTS, READONLY, EXCLUDE
 13 .gnu.lto__ZN5Print5writeEPKcj.6d7523effbb304cb 00000215  00000000  00000000  000011b0  2**0
                  CONTENTS, READONLY, EXCLUDE
 14 .gnu.lto__ZN5Print5printEPK19__FlashStringHelper.6d7523effbb304cb 00000442  00000000  00000000  000013c5  2**0
                  CONTENTS, READONLY, EXCLUDE
 15 .gnu.lto__ZN5Print5printERK6String.6d7523effbb304cb 0000025a  00000000  00000000  00001807  2**0
                  CONTENTS, READONLY, EXCLUDE
 16 .gnu.lto__ZN5Print5printEPKc.6d7523effbb304cb 00000187  00000000  00000000  00001a61  2**0
                  CONTENTS, READONLY, EXCLUDE
 17 .gnu.lto__ZN5Print5printEc.6d7523effbb304cb 000001f5  00000000  00000000  00001be8  2**0
                  CONTENTS, READONLY, EXCLUDE
 18 .gnu.lto__ZN5Print5printERK9Printable.6d7523effbb304cb 000001e6  00000000  00000000  00001ddd  2**0
                  CONTENTS, READONLY, EXCLUDE
 19 .gnu.lto__ZN5Print7printlnEv.6d7523effbb304cb 0000017a  00000000  00000000  00001fc3  2**0
                  CONTENTS, READONLY, EXCLUDE
 20 .gnu.lto__ZN5Print7printlnEPK19__FlashStringHelper.6d7523effbb304cb 000001f9  00000000  00000000  0000213d  2**0
                  CONTENTS, READONLY, EXCLUDE
 21 .gnu.lto__ZN5Print7printlnERK6String.6d7523effbb304cb 000001f1  00000000  00000000  00002336  2**0
                  CONTENTS, READONLY, EXCLUDE
 22 .gnu.lto__ZN5Print7printlnEPKc.6d7523effbb304cb 00000250  00000000  00000000  00002527  2**0
                  CONTENTS, READONLY, EXCLUDE
 23 .gnu.lto__ZN5Print7printlnEc.6d7523effbb304cb 000001f8  00000000  00000000  00002777  2**0
                  CONTENTS, READONLY, EXCLUDE
 24 .gnu.lto__ZN5Print7printlnERK9Printable.6d7523effbb304cb 000001f0  00000000  00000000  0000296f  2**0
                  CONTENTS, READONLY, EXCLUDE
 25 .gnu.lto__ZN5Print11printNumberEmh.6d7523effbb304cb 00000517  00000000  00000000  00002b5f  2**0
                  CONTENTS, READONLY, EXCLUDE
 26 .gnu.lto__ZN5Print5printEli.part.2.6d7523effbb304cb 000002e2  00000000  00000000  00003076  2**0
                  CONTENTS, READONLY, EXCLUDE
 27 .gnu.lto__ZN5Print5printEli.6d7523effbb304cb 0000039e  00000000  00000000  00003358  2**0
                  CONTENTS, READONLY, EXCLUDE
 28 .gnu.lto__ZN5Print5printEii.6d7523effbb304cb 000001b9  00000000  00000000  000036f6  2**0
                  CONTENTS, READONLY, EXCLUDE
 29 .gnu.lto__ZN5Print7printlnEii.6d7523effbb304cb 0000028b  00000000  00000000  000038af  2**0
                  CONTENTS, READONLY, EXCLUDE
 30 .gnu.lto__ZN5Print7printlnEli.6d7523effbb304cb 0000023b  00000000  00000000  00003b3a  2**0
                  CONTENTS, READONLY, EXCLUDE
 31 .gnu.lto__ZN5Print5printEhi.6d7523effbb304cb 000001be  00000000  00000000  00003d75  2**0
                  CONTENTS, READONLY, EXCLUDE
 32 .gnu.lto__ZN5Print7printlnEhi.6d7523effbb304cb 00000296  00000000  00000000  00003f33  2**0
                  CONTENTS, READONLY, EXCLUDE
 33 .gnu.lto__ZN5Print5printEji.6d7523effbb304cb 000001b9  00000000  00000000  000041c9  2**0
                  CONTENTS, READONLY, EXCLUDE
 34 .gnu.lto__ZN5Print7printlnEji.6d7523effbb304cb 00000295  00000000  00000000  00004382  2**0
                  CONTENTS, READONLY, EXCLUDE
 35 .gnu.lto__ZN5Print7printlnEmi.6d7523effbb304cb 0000023c  00000000  00000000  00004617  2**0
                  CONTENTS, READONLY, EXCLUDE
 36 .gnu.lto__ZN5Print10printFloatEdh.part.4.6d7523effbb304cb 00000736  00000000  00000000  00004853  2**0
                  CONTENTS, READONLY, EXCLUDE
 37 .gnu.lto__ZN5Print10printFloatEdh.6d7523effbb304cb 00000503  00000000  00000000  00004f89  2**0
                  CONTENTS, READONLY, EXCLUDE
 38 .gnu.lto__ZN5Print5printEdi.6d7523effbb304cb 000001db  00000000  00000000  0000548c  2**0
                  CONTENTS, READONLY, EXCLUDE
 39 .gnu.lto__ZN5Print7printlnEdi.6d7523effbb304cb 000002b1  00000000  00000000  00005667  2**0
                  CONTENTS, READONLY, EXCLUDE
 40 .gnu.lto_.symbol_nodes.6d7523effbb304cb 000001e0  00000000  00000000  00005918  2**0
                  CONTENTS, READONLY, EXCLUDE
 41 .gnu.lto_.refs.6d7523effbb304cb 0000001a  00000000  00000000  00005af8  2**0
                  CONTENTS, READONLY, EXCLUDE
 42 .gnu.lto_.decls.6d7523effbb304cb 00001705  00000000  00000000  00005b12  2**0
                  CONTENTS, READONLY, EXCLUDE
 43 .gnu.lto_.symtab.6d7523effbb304cb 00000518  00000000  00000000  00007217  2**0
                  CONTENTS, READONLY, EXCLUDE
 44 .gnu.lto_.opts 00000099  00000000  00000000  0000772f  2**0
                  CONTENTS, READONLY, EXCLUDE
 45 .comment      00000012  00000000  00000000  000077c8  2**0
                  CONTENTS, READONLY

Stream.cpp.o:     file format elf32-avr

Sections:
Idx Name          Size      VMA       LMA       File off  Algn
  0 .text         00000000  00000000  00000000  00000034  2**0
                  CONTENTS, ALLOC, LOAD, READONLY, CODE
  1 .data         00000000  00000000  00000000  00000034  2**0
                  CONTENTS, ALLOC, LOAD, DATA
  2 .bss          00000000  00000000  00000000  00000034  2**0
                  ALLOC
  3 .gnu.lto_.profile.7eda324b9b456147 00000015  00000000  00000000  00000034  2**0
                  CONTENTS, READONLY, EXCLUDE
  4 .gnu.lto_.jmpfuncs.7eda324b9b456147 00000128  00000000  00000000  00000049  2**0
                  CONTENTS, READONLY, EXCLUDE
  5 .gnu.lto_.inline.7eda324b9b456147 000001c0  00000000  00000000  00000171  2**0
                  CONTENTS, READONLY, EXCLUDE
  6 .gnu.lto_.pureconst.7eda324b9b456147 00000032  00000000  00000000  00000331  2**0
                  CONTENTS, READONLY, EXCLUDE
  7 .gnu.lto__ZN6Stream9timedReadEv.7eda324b9b456147 00000316  00000000  00000000  00000363  2**0
                  CONTENTS, READONLY, EXCLUDE
  8 .gnu.lto__ZN6Stream14readBytesUntilEcPcj.part.0.7eda324b9b456147 0000039f  00000000  00000000  00000679  2**0
                  CONTENTS, READONLY, EXCLUDE
  9 .gnu.lto__ZN6Stream14readBytesUntilEcPcj.7eda324b9b456147 00000278  00000000  00000000  00000a18  2**0
                  CONTENTS, READONLY, EXCLUDE
 10 .gnu.lto__ZN6Stream9timedPeekEv.7eda324b9b456147 00000313  00000000  00000000  00000c90  2**0
                  CONTENTS, READONLY, EXCLUDE
 11 .gnu.lto__ZN6Stream13peekNextDigitE13LookaheadModeb.7eda324b9b456147 000004a8  00000000  00000000  00000fa3  2**0
                  CONTENTS, READONLY, EXCLUDE
 12 .gnu.lto__ZN6Stream10setTimeoutEm.7eda324b9b456147 000001c3  00000000  00000000  0000144b  2**0
                  CONTENTS, READONLY, EXCLUDE
 13 .gnu.lto__ZN6Stream8parseIntE13LookaheadModec.7eda324b9b456147 000005dd  00000000  00000000  0000160e  2**0
                  CONTENTS, READONLY, EXCLUDE
 14 .gnu.lto__ZN6Stream10parseFloatE13LookaheadModec.7eda324b9b456147 000007cc  00000000  00000000  00001beb  2**0
                  CONTENTS, READONLY, EXCLUDE
 15 .gnu.lto__ZN6Stream9readBytesEPcj.7eda324b9b456147 00000325  00000000  00000000  000023b7  2**0
                  CONTENTS, READONLY, EXCLUDE
 16 .gnu.lto__ZN6Stream10readStringEv.7eda324b9b456147 00000338  00000000  00000000  000026dc  2**0
                  CONTENTS, READONLY, EXCLUDE
 17 .gnu.lto__ZN6Stream15readStringUntilEc.7eda324b9b456147 00000399  00000000  00000000  00002a14  2**0
                  CONTENTS, READONLY, EXCLUDE
 18 .gnu.lto__ZN6Stream9findMultiEPNS_11MultiTargetEi.7eda324b9b456147 000007c4  00000000  00000000  00002dad  2**0
                  CONTENTS, READONLY, EXCLUDE
 19 .gnu.lto__ZN6Stream9findUntilEPcjS0_j.part.1.7eda324b9b456147 0000039d  00000000  00000000  00003571  2**0
                  CONTENTS, READONLY, EXCLUDE
 20 .gnu.lto__ZN6Stream9findUntilEPcjS0_j.7eda324b9b456147 000003a2  00000000  00000000  0000390e  2**0
                  CONTENTS, READONLY, EXCLUDE
 21 .gnu.lto__ZN6Stream4findEPc.7eda324b9b456147 000001bd  00000000  00000000  00003cb0  2**0
                  CONTENTS, READONLY, EXCLUDE
 22 .gnu.lto__ZN6Stream4findEPcj.7eda324b9b456147 000001cf  00000000  00000000  00003e6d  2**0
                  CONTENTS, READONLY, EXCLUDE
 23 .gnu.lto__ZN6Stream9findUntilEPcS0_.7eda324b9b456147 000001e3  00000000  00000000  0000403c  2**0
                  CONTENTS, READONLY, EXCLUDE
 24 .gnu.lto_.symbol_nodes.7eda324b9b456147 00000153  00000000  00000000  0000421f  2**0
                  CONTENTS, READONLY, EXCLUDE
 25 .gnu.lto_.refs.7eda324b9b456147 0000000f  00000000  00000000  00004372  2**0
                  CONTENTS, READONLY, EXCLUDE
 26 .gnu.lto_.decls.7eda324b9b456147 000014a8  00000000  00000000  00004381  2**0
                  CONTENTS, READONLY, EXCLUDE
 27 .gnu.lto_.symtab.7eda324b9b456147 000002f1  00000000  00000000  00005829  2**0
                  CONTENTS, READONLY, EXCLUDE
 28 .gnu.lto_.opts 00000099  00000000  00000000  00005b1a  2**0
                  CONTENTS, READONLY, EXCLUDE
 29 .comment      00000012  00000000  00000000  00005bb3  2**0
                  CONTENTS, READONLY

Tone.cpp.o:     file format elf32-avr

Sections:
Idx Name          Size      VMA       LMA       File off  Algn
  0 .text         00000000  00000000  00000000  00000034  2**0
                  CONTENTS, ALLOC, LOAD, READONLY, CODE
  1 .data         00000000  00000000  00000000  00000034  2**0
                  CONTENTS, ALLOC, LOAD, DATA
  2 .bss          00000000  00000000  00000000  00000034  2**0
                  ALLOC
  3 .gnu.lto_.profile.d32f83216bfafb1f 00000015  00000000  00000000  00000034  2**0
                  CONTENTS, READONLY, EXCLUDE
  4 .gnu.lto_.jmpfuncs.d32f83216bfafb1f 00000059  00000000  00000000  00000049  2**0
                  CONTENTS, READONLY, EXCLUDE
  5 .gnu.lto_.inline.d32f83216bfafb1f 00000124  00000000  00000000  000000a2  2**0
                  CONTENTS, READONLY, EXCLUDE
  6 .gnu.lto_.pureconst.d32f83216bfafb1f 0000001c  00000000  00000000  000001c6  2**0
                  CONTENTS, READONLY, EXCLUDE
  7 .gnu.lto__ZL9toneBeginh.d32f83216bfafb1f 000013cc  00000000  00000000  000001e2  2**0
                  CONTENTS, READONLY, EXCLUDE
  8 .gnu.lto__Z12disableTimerh.part.0.d32f83216bfafb1f 000002a2  00000000  00000000  000015ae  2**0
                  CONTENTS, READONLY, EXCLUDE
  9 .gnu.lto__Z12disableTimerh.d32f83216bfafb1f 00000392  00000000  00000000  00001850  2**0
                  CONTENTS, READONLY, EXCLUDE
 10 .gnu.lto__Z4tonehjm.d32f83216bfafb1f 00000ef6  00000000  00000000  00001be2  2**0
                  CONTENTS, READONLY, EXCLUDE
 11 .gnu.lto__Z6noToneh.d32f83216bfafb1f 0000047d  00000000  00000000  00002ad8  2**0
                  CONTENTS, READONLY, EXCLUDE
 12 .gnu.lto___vector_13.d32f83216bfafb1f 00000297  00000000  00000000  00002f55  2**0
                  CONTENTS, READONLY, EXCLUDE
 13 .gnu.lto_.symbol_nodes.d32f83216bfafb1f 000000eb  00000000  00000000  000031ec  2**0
                  CONTENTS, READONLY, EXCLUDE
 14 .gnu.lto_.refs.d32f83216bfafb1f 000000b1  00000000  00000000  000032d7  2**0
                  CONTENTS, READONLY, EXCLUDE
 15 .gnu.lto_.decls.d32f83216bfafb1f 00000e97  00000000  00000000  00003388  2**0
                  CONTENTS, READONLY, EXCLUDE
 16 .gnu.lto_.symtab.d32f83216bfafb1f 0000035d  00000000  00000000  0000421f  2**0
                  CONTENTS, READONLY, EXCLUDE
 17 .gnu.lto_.opts 00000099  00000000  00000000  0000457c  2**0
                  CONTENTS, READONLY, EXCLUDE
 18 .comment      00000012  00000000  00000000  00004615  2**0
                  CONTENTS, READONLY

USBCore.cpp.o:     file format elf32-avr

Sections:
Idx Name          Size      VMA       LMA       File off  Algn
  0 .text         00000000  00000000  00000000  00000034  2**0
                  CONTENTS, ALLOC, LOAD, READONLY, CODE
  1 .data         00000000  00000000  00000000  00000034  2**0
                  CONTENTS, ALLOC, LOAD, DATA
  2 .bss          00000000  00000000  00000000  00000034  2**0
                  ALLOC
  3 .gnu.lto_.profile.61d4813a907e230e 0000000f  00000000  00000000  00000034  2**0
                  CONTENTS, READONLY, EXCLUDE
  4 .gnu.lto_.inline.61d4813a907e230e 0000000e  00000000  00000000  00000043  2**0
                  CONTENTS, READONLY, EXCLUDE
  5 .gnu.lto_.pureconst.61d4813a907e230e 0000000f  00000000  00000000  00000051  2**0
                  CONTENTS, READONLY, EXCLUDE
  6 .gnu.lto_.symbol_nodes.61d4813a907e230e 0000000f  00000000  00000000  00000060  2**0
                  CONTENTS, READONLY, EXCLUDE
  7 .gnu.lto_.refs.61d4813a907e230e 0000000f  00000000  00000000  0000006f  2**0
                  CONTENTS, READONLY, EXCLUDE
  8 .gnu.lto_.decls.61d4813a907e230e 0000001a  00000000  00000000  0000007e  2**0
                  CONTENTS, READONLY, EXCLUDE
  9 .gnu.lto_.symtab.61d4813a907e230e 00000000  00000000  00000000  00000098  2**0
                  CONTENTS, READONLY, EXCLUDE
 10 .gnu.lto_.opts 00000099  00000000  00000000  00000098  2**0
                  CONTENTS, READONLY, EXCLUDE
 11 .comment      00000012  00000000  00000000  00000131  2**0
                  CONTENTS, READONLY

WMath.cpp.o:     file format elf32-avr

Sections:
Idx Name          Size      VMA       LMA       File off  Algn
  0 .text         00000000  00000000  00000000  00000034  2**0
                  CONTENTS, ALLOC, LOAD, READONLY, CODE
  1 .data         00000000  00000000  00000000  00000034  2**0
                  CONTENTS, ALLOC, LOAD, DATA
  2 .bss          00000000  00000000  00000000  00000034  2**0
                  ALLOC
  3 .gnu.lto_.profile.6290ad84265b53c3 00000013  00000000  00000000  00000034  2**0
                  CONTENTS, READONLY, EXCLUDE
  4 .gnu.lto_.jmpfuncs.6290ad84265b53c3 0000003c  00000000  00000000  00000047  2**0
                  CONTENTS, READONLY, EXCLUDE
  5 .gnu.lto_.inline.6290ad84265b53c3 000000c4  00000000  00000000  00000083  2**0
                  CONTENTS, READONLY, EXCLUDE
  6 .gnu.lto_.pureconst.6290ad84265b53c3 0000001e  00000000  00000000  00000147  2**0
                  CONTENTS, READONLY, EXCLUDE
  7 .gnu.lto__Z10randomSeedm.6290ad84265b53c3 00000184  00000000  00000000  00000165  2**0
                  CONTENTS, READONLY, EXCLUDE
  8 .gnu.lto__Z6randoml.6290ad84265b53c3 000001ac  00000000  00000000  000002e9  2**0
                  CONTENTS, READONLY, EXCLUDE
  9 .gnu.lto__Z6randomll.part.0.6290ad84265b53c3 000001f2  00000000  00000000  00000495  2**0
                  CONTENTS, READONLY, EXCLUDE
 10 .gnu.lto__Z6randomll.6290ad84265b53c3 000001ec  00000000  00000000  00000687  2**0
                  CONTENTS, READONLY, EXCLUDE
 11 .gnu.lto__Z3maplllll.6290ad84265b53c3 0000020a  00000000  00000000  00000873  2**0
                  CONTENTS, READONLY, EXCLUDE
 12 .gnu.lto__Z8makeWordj.6290ad84265b53c3 0000012a  00000000  00000000  00000a7d  2**0
                  CONTENTS, READONLY, EXCLUDE
 13 .gnu.lto__Z8makeWordhh.6290ad84265b53c3 0000019b  00000000  00000000  00000ba7  2**0
                  CONTENTS, READONLY, EXCLUDE
 14 .gnu.lto_.symbol_nodes.6290ad84265b53c3 00000066  00000000  00000000  00000d42  2**0
                  CONTENTS, READONLY, EXCLUDE
 15 .gnu.lto_.refs.6290ad84265b53c3 0000000f  00000000  00000000  00000da8  2**0
                  CONTENTS, READONLY, EXCLUDE
 16 .gnu.lto_.decls.6290ad84265b53c3 00000430  00000000  00000000  00000db7  2**0
                  CONTENTS, READONLY, EXCLUDE
 17 .gnu.lto_.symtab.6290ad84265b53c3 000000d5  00000000  00000000  000011e7  2**0
                  CONTENTS, READONLY, EXCLUDE
 18 .gnu.lto_.opts 00000099  00000000  00000000  000012bc  2**0
                  CONTENTS, READONLY, EXCLUDE
 19 .comment      00000012  00000000  00000000  00001355  2**0
                  CONTENTS, READONLY

WString.cpp.o:     file format elf32-avr

Sections:
Idx Name          Size      VMA       LMA       File off  Algn
  0 .text         00000000  00000000  00000000  00000034  2**0
                  CONTENTS, ALLOC, LOAD, READONLY, CODE
  1 .data         00000000  00000000  00000000  00000034  2**0
                  CONTENTS, ALLOC, LOAD, DATA
  2 .bss          00000000  00000000  00000000  00000034  2**0
                  ALLOC
  3 .gnu.lto_.profile.5e672a15ccb78d4a 00000015  00000000  00000000  00000034  2**0
                  CONTENTS, READONLY, EXCLUDE
  4 .gnu.lto_.jmpfuncs.5e672a15ccb78d4a 000002da  00000000  00000000  00000049  2**0
                  CONTENTS, READONLY, EXCLUDE
  5 .gnu.lto_.inline.5e672a15ccb78d4a 000007ac  00000000  00000000  00000323  2**0
                  CONTENTS, READONLY, EXCLUDE
  6 .gnu.lto_.pureconst.5e672a15ccb78d4a 000000bd  00000000  00000000  00000acf  2**0
                  CONTENTS, READONLY, EXCLUDE
  7 .gnu.lto__ZNK6String14StringIfHelperEv.5e672a15ccb78d4a 00000124  00000000  00000000  00000b8c  2**0
                  CONTENTS, READONLY, EXCLUDE
  8 .gnu.lto__ZNK6StringcvMS_KFvvEEv.isra.0.5e672a15ccb78d4a 000002a3  00000000  00000000  00000cb0  2**0
                  CONTENTS, READONLY, EXCLUDE
  9 .gnu.lto__ZNK6StringcvMS_KFvvEEv.5e672a15ccb78d4a 00000102  00000000  00000000  00000f53  2**0
                  CONTENTS, READONLY, EXCLUDE
 10 .gnu.lto__ZN6String7reserveEj.part.1.5e672a15ccb78d4a 00000279  00000000  00000000  00001055  2**0
                  CONTENTS, READONLY, EXCLUDE
 11 .gnu.lto__ZN6String7reserveEj.5e672a15ccb78d4a 000002a2  00000000  00000000  000012ce  2**0
                  CONTENTS, READONLY, EXCLUDE
 12 .gnu.lto__ZN6String4moveERS_.part.2.5e672a15ccb78d4a 00000280  00000000  00000000  00001570  2**0
                  CONTENTS, READONLY, EXCLUDE
 13 .gnu.lto__ZN6String4moveERS_.5e672a15ccb78d4a 00000487  00000000  00000000  000017f0  2**0
                  CONTENTS, READONLY, EXCLUDE
 14 .gnu.lto__ZNK6String6equalsEPKc.part.3.5e672a15ccb78d4a 00000207  00000000  00000000  00001c77  2**0
                  CONTENTS, READONLY, EXCLUDE
 15 .gnu.lto__ZNK6String6equalsEPKc.5e672a15ccb78d4a 0000030b  00000000  00000000  00001e7e  2**0
                  CONTENTS, READONLY, EXCLUDE
 16 .gnu.lto__ZNK6String16equalsIgnoreCaseERKS_.part.4.5e672a15ccb78d4a 00000367  00000000  00000000  00002189  2**0
                  CONTENTS, READONLY, EXCLUDE
 17 .gnu.lto__ZNK6String16equalsIgnoreCaseERKS_.5e672a15ccb78d4a 000002d9  00000000  00000000  000024f0  2**0
                  CONTENTS, READONLY, EXCLUDE
 18 .gnu.lto__ZNK6StringixEj.part.6.5e672a15ccb78d4a 00000221  00000000  00000000  000027c9  2**0
                  CONTENTS, READONLY, EXCLUDE
 19 .gnu.lto__ZNK6StringixEj.5e672a15ccb78d4a 0000020f  00000000  00000000  000029ea  2**0
                  CONTENTS, READONLY, EXCLUDE
 20 .gnu.lto__ZNK6String8getBytesEPhjj.part.7.5e672a15ccb78d4a 0000036d  00000000  00000000  00002bf9  2**0
                  CONTENTS, READONLY, EXCLUDE
 21 .gnu.lto__ZNK6String8getBytesEPhjj.5e672a15ccb78d4a 0000026a  00000000  00000000  00002f66  2**0
                  CONTENTS, READONLY, EXCLUDE
 22 .gnu.lto__ZN6String4trimEv.part.8.5e672a15ccb78d4a 00000238  00000000  00000000  000031d0  2**0
                  CONTENTS, READONLY, EXCLUDE
 23 .gnu.lto__ZN6String4trimEv.5e672a15ccb78d4a 00000474  00000000  00000000  00003408  2**0
                  CONTENTS, READONLY, EXCLUDE
 24 .gnu.lto__ZN6StringD2Ev.5e672a15ccb78d4a 000001c9  00000000  00000000  0000387c  2**0
                  CONTENTS, READONLY, EXCLUDE
 25 .gnu.lto__ZN6String10invalidateEv.5e672a15ccb78d4a 0000020f  00000000  00000000  00003a45  2**0
                  CONTENTS, READONLY, EXCLUDE
 26 .gnu.lto__ZN6String12changeBufferEj.5e672a15ccb78d4a 000002b4  00000000  00000000  00003c54  2**0
                  CONTENTS, READONLY, EXCLUDE
 27 .gnu.lto__ZN6String4copyEPKcj.5e672a15ccb78d4a 00000280  00000000  00000000  00003f08  2**0
                  CONTENTS, READONLY, EXCLUDE
 28 .gnu.lto__ZN6StringC2EPKc.5e672a15ccb78d4a 0000028c  00000000  00000000  00004188  2**0
                  CONTENTS, READONLY, EXCLUDE
 29 .gnu.lto__ZN6String4copyEPK19__FlashStringHelperj.5e672a15ccb78d4a 00000281  00000000  00000000  00004414  2**0
                  CONTENTS, READONLY, EXCLUDE
 30 .gnu.lto__ZN6StringC2EOS_.5e672a15ccb78d4a 00000243  00000000  00000000  00004695  2**0
                  CONTENTS, READONLY, EXCLUDE
 31 .gnu.lto__ZN6StringC2EO15StringSumHelper.5e672a15ccb78d4a 00000283  00000000  00000000  000048d8  2**0
                  CONTENTS, READONLY, EXCLUDE
 32 .gnu.lto__ZN6StringaSERKS_.5e672a15ccb78d4a 0000023e  00000000  00000000  00004b5b  2**0
                  CONTENTS, READONLY, EXCLUDE
 33 .gnu.lto__ZN6StringC2ERKS_.5e672a15ccb78d4a 00000243  00000000  00000000  00004d99  2**0
                  CONTENTS, READONLY, EXCLUDE
 34 .gnu.lto__ZN6StringaSEOS_.5e672a15ccb78d4a 000001b0  00000000  00000000  00004fdc  2**0
                  CONTENTS, READONLY, EXCLUDE
 35 .gnu.lto__ZN6StringaSEO15StringSumHelper.5e672a15ccb78d4a 00000203  00000000  00000000  0000518c  2**0
                  CONTENTS, READONLY, EXCLUDE
 36 .gnu.lto__ZN6StringaSEPKc.5e672a15ccb78d4a 000001f6  00000000  00000000  0000538f  2**0
                  CONTENTS, READONLY, EXCLUDE
 37 .gnu.lto__ZN6StringC2Ec.5e672a15ccb78d4a 000002d1  00000000  00000000  00005585  2**0
                  CONTENTS, READONLY, EXCLUDE
 38 .gnu.lto__ZN6StringC2Ehh.5e672a15ccb78d4a 000004eb  00000000  00000000  00005856  2**0
                  CONTENTS, READONLY, EXCLUDE
 39 .gnu.lto__ZN6StringC2Eih.5e672a15ccb78d4a 000004df  00000000  00000000  00005d41  2**0
                  CONTENTS, READONLY, EXCLUDE
 40 .gnu.lto__ZN6StringC2Ejh.5e672a15ccb78d4a 000004e1  00000000  00000000  00006220  2**0
                  CONTENTS, READONLY, EXCLUDE
 41 .gnu.lto__ZN6StringC2Elh.5e672a15ccb78d4a 00000500  00000000  00000000  00006701  2**0
                  CONTENTS, READONLY, EXCLUDE
 42 .gnu.lto__ZN6StringC2Emh.5e672a15ccb78d4a 000004fe  00000000  00000000  00006c01  2**0
                  CONTENTS, READONLY, EXCLUDE
 43 .gnu.lto__ZN6StringC2Efh.5e672a15ccb78d4a 00000346  00000000  00000000  000070ff  2**0
                  CONTENTS, READONLY, EXCLUDE
 44 .gnu.lto__ZN6StringC2Edh.5e672a15ccb78d4a 00000346  00000000  00000000  00007445  2**0
                  CONTENTS, READONLY, EXCLUDE
 45 .gnu.lto__ZN6StringaSEPK19__FlashStringHelper.5e672a15ccb78d4a 000002e8  00000000  00000000  0000778b  2**0
                  CONTENTS, READONLY, EXCLUDE
 46 .gnu.lto__ZN6StringC2EPK19__FlashStringHelper.5e672a15ccb78d4a 00000243  00000000  00000000  00007a73  2**0
                  CONTENTS, READONLY, EXCLUDE
 47 .gnu.lto__ZN6String6concatEPKcj.5e672a15ccb78d4a 00000342  00000000  00000000  00007cb6  2**0
                  CONTENTS, READONLY, EXCLUDE
 48 .gnu.lto__ZN6String6concatERKS_.5e672a15ccb78d4a 000001e2  00000000  00000000  00007ff8  2**0
                  CONTENTS, READONLY, EXCLUDE
 49 .gnu.lto__ZN6String6concatEPKc.5e672a15ccb78d4a 000001fb  00000000  00000000  000081da  2**0
                  CONTENTS, READONLY, EXCLUDE
 50 .gnu.lto__ZN6String6concatEc.5e672a15ccb78d4a 0000023c  00000000  00000000  000083d5  2**0
                  CONTENTS, READONLY, EXCLUDE
 51 .gnu.lto__ZN6String6concatEh.5e672a15ccb78d4a 0000033e  00000000  00000000  00008611  2**0
                  CONTENTS, READONLY, EXCLUDE
 52 .gnu.lto__ZN6String6concatEi.5e672a15ccb78d4a 00000330  00000000  00000000  0000894f  2**0
                  CONTENTS, READONLY, EXCLUDE
 53 .gnu.lto__ZN6String6concatEj.5e672a15ccb78d4a 0000032f  00000000  00000000  00008c7f  2**0
                  CONTENTS, READONLY, EXCLUDE
 54 .gnu.lto__ZN6String6concatEl.5e672a15ccb78d4a 00000347  00000000  00000000  00008fae  2**0
                  CONTENTS, READONLY, EXCLUDE
 55 .gnu.lto__ZN6String6concatEm.5e672a15ccb78d4a 00000347  00000000  00000000  000092f5  2**0
                  CONTENTS, READONLY, EXCLUDE
 56 .gnu.lto__ZN6String6concatEf.5e672a15ccb78d4a 0000029a  00000000  00000000  0000963c  2**0
                  CONTENTS, READONLY, EXCLUDE
 57 .gnu.lto__ZN6String6concatEd.5e672a15ccb78d4a 0000029b  00000000  00000000  000098d6  2**0
                  CONTENTS, READONLY, EXCLUDE
 58 .gnu.lto__ZN6String6concatEPK19__FlashStringHelper.5e672a15ccb78d4a 00000452  00000000  00000000  00009b71  2**0
                  CONTENTS, READONLY, EXCLUDE
 59 .gnu.lto__ZplRK15StringSumHelperRK6String.5e672a15ccb78d4a 0000029f  00000000  00000000  00009fc3  2**0
                  CONTENTS, READONLY, EXCLUDE
 60 .gnu.lto__ZplRK15StringSumHelperPKc.5e672a15ccb78d4a 000002f4  00000000  00000000  0000a262  2**0
                  CONTENTS, READONLY, EXCLUDE
 61 .gnu.lto__ZplRK15StringSumHelperc.5e672a15ccb78d4a 00000264  00000000  00000000  0000a556  2**0
                  CONTENTS, READONLY, EXCLUDE
 62 .gnu.lto__ZplRK15StringSumHelperh.5e672a15ccb78d4a 00000266  00000000  00000000  0000a7ba  2**0
                  CONTENTS, READONLY, EXCLUDE
 63 .gnu.lto__ZplRK15StringSumHelperi.5e672a15ccb78d4a 0000025d  00000000  00000000  0000aa20  2**0
                  CONTENTS, READONLY, EXCLUDE
 64 .gnu.lto__ZplRK15StringSumHelperj.5e672a15ccb78d4a 00000260  00000000  00000000  0000ac7d  2**0
                  CONTENTS, READONLY, EXCLUDE
 65 .gnu.lto__ZplRK15StringSumHelperl.5e672a15ccb78d4a 0000027a  00000000  00000000  0000aedd  2**0
                  CONTENTS, READONLY, EXCLUDE
 66 .gnu.lto__ZplRK15StringSumHelperm.5e672a15ccb78d4a 0000027b  00000000  00000000  0000b157  2**0
                  CONTENTS, READONLY, EXCLUDE
 67 .gnu.lto__ZplRK15StringSumHelperf.5e672a15ccb78d4a 00000278  00000000  00000000  0000b3d2  2**0
                  CONTENTS, READONLY, EXCLUDE
 68 .gnu.lto__ZplRK15StringSumHelperd.5e672a15ccb78d4a 00000279  00000000  00000000  0000b64a  2**0
                  CONTENTS, READONLY, EXCLUDE
 69 .gnu.lto__ZplRK15StringSumHelperPK19__FlashStringHelper.5e672a15ccb78d4a 0000025f  00000000  00000000  0000b8c3  2**0
                  CONTENTS, READONLY, EXCLUDE
 70 .gnu.lto__ZNK6String9compareToERKS_.5e672a15ccb78d4a 0000033c  00000000  00000000  0000bb22  2**0
                  CONTENTS, READONLY, EXCLUDE
 71 .gnu.lto__ZNK6String6equalsERKS_.5e672a15ccb78d4a 00000258  00000000  00000000  0000be5e  2**0
                  CONTENTS, READONLY, EXCLUDE
 72 .gnu.lto__ZNK6StringltERKS_.5e672a15ccb78d4a 000001ae  00000000  00000000  0000c0b6  2**0
                  CONTENTS, READONLY, EXCLUDE
 73 .gnu.lto__ZNK6StringgtERKS_.5e672a15ccb78d4a 000001af  00000000  00000000  0000c264  2**0
                  CONTENTS, READONLY, EXCLUDE
 74 .gnu.lto__ZNK6StringleERKS_.5e672a15ccb78d4a 000001ae  00000000  00000000  0000c413  2**0
                  CONTENTS, READONLY, EXCLUDE
 75 .gnu.lto__ZNK6StringgeERKS_.5e672a15ccb78d4a 000001b0  00000000  00000000  0000c5c1  2**0
                  CONTENTS, READONLY, EXCLUDE
 76 .gnu.lto__ZNK6String10startsWithERKS_j.5e672a15ccb78d4a 000002f2  00000000  00000000  0000c771  2**0
                  CONTENTS, READONLY, EXCLUDE
 77 .gnu.lto__ZNK6String10startsWithERKS_.part.5.5e672a15ccb78d4a 000001b0  00000000  00000000  0000ca63  2**0
                  CONTENTS, READONLY, EXCLUDE
 78 .gnu.lto__ZNK6String10startsWithERKS_.5e672a15ccb78d4a 00000222  00000000  00000000  0000cc13  2**0
                  CONTENTS, READONLY, EXCLUDE
 79 .gnu.lto__ZNK6String8endsWithERKS_.5e672a15ccb78d4a 000002bd  00000000  00000000  0000ce35  2**0
                  CONTENTS, READONLY, EXCLUDE
 80 .gnu.lto__ZN6String9setCharAtEjc.5e672a15ccb78d4a 0000024d  00000000  00000000  0000d0f2  2**0
                  CONTENTS, READONLY, EXCLUDE
 81 .gnu.lto__ZN6StringixEj.5e672a15ccb78d4a 0000027b  00000000  00000000  0000d33f  2**0
                  CONTENTS, READONLY, EXCLUDE
 82 .gnu.lto__ZNK6String6charAtEj.5e672a15ccb78d4a 00000190  00000000  00000000  0000d5ba  2**0
                  CONTENTS, READONLY, EXCLUDE
 83 .gnu.lto__ZNK6String7indexOfEcj.5e672a15ccb78d4a 000002fc  00000000  00000000  0000d74a  2**0
                  CONTENTS, READONLY, EXCLUDE
 84 .gnu.lto__ZNK6String7indexOfEc.5e672a15ccb78d4a 0000019d  00000000  00000000  0000da46  2**0
                  CONTENTS, READONLY, EXCLUDE
 85 .gnu.lto__ZNK6String7indexOfERKS_j.5e672a15ccb78d4a 00000304  00000000  00000000  0000dbe3  2**0
                  CONTENTS, READONLY, EXCLUDE
 86 .gnu.lto__ZNK6String7indexOfERKS_.5e672a15ccb78d4a 00000196  00000000  00000000  0000dee7  2**0
                  CONTENTS, READONLY, EXCLUDE
 87 .gnu.lto__ZNK6String11lastIndexOfEcj.5e672a15ccb78d4a 000003c3  00000000  00000000  0000e07d  2**0
                  CONTENTS, READONLY, EXCLUDE
 88 .gnu.lto__ZNK6String11lastIndexOfEc.5e672a15ccb78d4a 000001f1  00000000  00000000  0000e440  2**0
                  CONTENTS, READONLY, EXCLUDE
 89 .gnu.lto__ZNK6String11lastIndexOfERKS_j.5e672a15ccb78d4a 000004ad  00000000  00000000  0000e631  2**0
                  CONTENTS, READONLY, EXCLUDE
 90 .gnu.lto__ZNK6String11lastIndexOfERKS_.5e672a15ccb78d4a 000001eb  00000000  00000000  0000eade  2**0
                  CONTENTS, READONLY, EXCLUDE
 91 .gnu.lto__ZNK6String9substringEjj.5e672a15ccb78d4a 00000472  00000000  00000000  0000ecc9  2**0
                  CONTENTS, READONLY, EXCLUDE
 92 .gnu.lto__ZN6String7replaceEcc.5e672a15ccb78d4a 000002f9  00000000  00000000  0000f13b  2**0
                  CONTENTS, READONLY, EXCLUDE
 93 .gnu.lto__ZN6String7replaceERKS_S1_.5e672a15ccb78d4a 00000ad4  00000000  00000000  0000f434  2**0
                  CONTENTS, READONLY, EXCLUDE
 94 .gnu.lto__ZN6String6removeEjj.5e672a15ccb78d4a 000003a8  00000000  00000000  0000ff08  2**0
                  CONTENTS, READONLY, EXCLUDE
 95 .gnu.lto__ZN6String6removeEj.5e672a15ccb78d4a 0000019d  00000000  00000000  000102b0  2**0
                  CONTENTS, READONLY, EXCLUDE
 96 .gnu.lto__ZN6String11toLowerCaseEv.5e672a15ccb78d4a 000002bb  00000000  00000000  0001044d  2**0
                  CONTENTS, READONLY, EXCLUDE
 97 .gnu.lto__ZN6String11toUpperCaseEv.5e672a15ccb78d4a 000002bb  00000000  00000000  00010708  2**0
                  CONTENTS, READONLY, EXCLUDE
 98 .gnu.lto__ZNK6String5toIntEv.5e672a15ccb78d4a 000001fa  00000000  00000000  000109c3  2**0
                  CONTENTS, READONLY, EXCLUDE
 99 .gnu.lto__ZNK6String8toDoubleEv.5e672a15ccb78d4a 00000205  00000000  00000000  00010bbd  2**0
                  CONTENTS, READONLY, EXCLUDE
100 .gnu.lto__ZNK6String7toFloatEv.5e672a15ccb78d4a 00000173  00000000  00000000  00010dc2  2**0
                  CONTENTS, READONLY, EXCLUDE
101 .gnu.lto_.symbol_nodes.5e672a15ccb78d4a 0000063f  00000000  00000000  00010f35  2**0
                  CONTENTS, READONLY, EXCLUDE
102 .gnu.lto_.refs.5e672a15ccb78d4a 00000054  00000000  00000000  00011574  2**0
                  CONTENTS, READONLY, EXCLUDE
103 .gnu.lto_.decls.5e672a15ccb78d4a 00003942  00000000  00000000  000115c8  2**0
                  CONTENTS, READONLY, EXCLUDE
104 .gnu.lto_.symtab.5e672a15ccb78d4a 00000fdd  00000000  00000000  00014f0a  2**0
                  CONTENTS, READONLY, EXCLUDE
105 .gnu.lto_.opts 00000099  00000000  00000000  00015ee7  2**0
                  CONTENTS, READONLY, EXCLUDE
106 .comment      00000012  00000000  00000000  00015f80  2**0
                  CONTENTS, READONLY

abi.cpp.o:     file format elf32-avr

Sections:
Idx Name          Size      VMA       LMA       File off  Algn
  0 .text         00000000  00000000  00000000  00000034  2**0
                  CONTENTS, ALLOC, LOAD, READONLY, CODE
  1 .data         00000000  00000000  00000000  00000034  2**0
                  CONTENTS, ALLOC, LOAD, DATA
  2 .bss          00000000  00000000  00000000  00000034  2**0
                  ALLOC
  3 .gnu.lto_.profile.64cada669a3569fc 00000013  00000000  00000000  00000034  2**0
                  CONTENTS, READONLY, EXCLUDE
  4 .gnu.lto_.jmpfuncs.64cada669a3569fc 00000013  00000000  00000000  00000047  2**0
                  CONTENTS, READONLY, EXCLUDE
  5 .gnu.lto_.inline.64cada669a3569fc 00000021  00000000  00000000  0000005a  2**0
                  CONTENTS, READONLY, EXCLUDE
  6 .gnu.lto_.pureconst.64cada669a3569fc 00000014  00000000  00000000  0000007b  2**0
                  CONTENTS, READONLY, EXCLUDE
  7 .gnu.lto___cxa_pure_virtual.64cada669a3569fc 000000e9  00000000  00000000  0000008f  2**0
                  CONTENTS, READONLY, EXCLUDE
  8 .gnu.lto___cxa_deleted_virtual.64cada669a3569fc 000000e9  00000000  00000000  00000178  2**0
                  CONTENTS, READONLY, EXCLUDE
  9 .gnu.lto_.symbol_nodes.64cada669a3569fc 0000003d  00000000  00000000  00000261  2**0
                  CONTENTS, READONLY, EXCLUDE
 10 .gnu.lto_.refs.64cada669a3569fc 0000000f  00000000  00000000  0000029e  2**0
                  CONTENTS, READONLY, EXCLUDE
 11 .gnu.lto_.decls.64cada669a3569fc 00000274  00000000  00000000  000002ad  2**0
                  CONTENTS, READONLY, EXCLUDE
 12 .gnu.lto_.symtab.64cada669a3569fc 00000047  00000000  00000000  00000521  2**0
                  CONTENTS, READONLY, EXCLUDE
 13 .gnu.lto_.opts 00000099  00000000  00000000  00000568  2**0
                  CONTENTS, READONLY, EXCLUDE
 14 .comment      00000012  00000000  00000000  00000601  2**0
                  CONTENTS, READONLY

main.cpp.o:     file format elf32-avr

Sections:
Idx Name          Size      VMA       LMA       File off  Algn
  0 .text         00000000  00000000  00000000  00000034  2**0
                  CONTENTS, ALLOC, LOAD, READONLY, CODE
  1 .data         00000000  00000000  00000000  00000034  2**0
                  CONTENTS, ALLOC, LOAD, DATA
  2 .bss          00000000  00000000  00000000  00000034  2**0
                  ALLOC
  3 .gnu.lto_.profile.9019c461aa2b32df 00000013  00000000  00000000  00000034  2**0
                  CONTENTS, READONLY, EXCLUDE
  4 .gnu.lto_.jmpfuncs.9019c461aa2b32df 0000001b  00000000  00000000  00000047  2**0
                  CONTENTS, READONLY, EXCLUDE
  5 .gnu.lto_.inline.9019c461aa2b32df 00000039  00000000  00000000  00000062  2**0
                  CONTENTS, READONLY, EXCLUDE
  6 .gnu.lto_.pureconst.9019c461aa2b32df 00000018  00000000  00000000  0000009b  2**0
                  CONTENTS, READONLY, EXCLUDE
  7 .gnu.lto_atexit.9019c461aa2b32df 00000115  00000000  00000000  000000b3  2**0
                  CONTENTS, READONLY, EXCLUDE
  8 .gnu.lto_initVariant.9019c461aa2b32df 000000d0  00000000  00000000  000001c8  2**0
                  CONTENTS, READONLY, EXCLUDE
  9 .gnu.lto__Z8setupUSBv.9019c461aa2b32df 000000d0  00000000  00000000  00000298  2**0
                  CONTENTS, READONLY, EXCLUDE
 10 .gnu.lto_main.9019c461aa2b32df 00000193  00000000  00000000  00000368  2**0
                  CONTENTS, READONLY, EXCLUDE
 11 .gnu.lto_.symbol_nodes.9019c461aa2b32df 00000074  00000000  00000000  000004fb  2**0
                  CONTENTS, READONLY, EXCLUDE
 12 .gnu.lto_.refs.9019c461aa2b32df 00000015  00000000  00000000  0000056f  2**0
                  CONTENTS, READONLY, EXCLUDE
 13 .gnu.lto_.decls.9019c461aa2b32df 00000329  00000000  00000000  00000584  2**0
                  CONTENTS, READONLY, EXCLUDE
 14 .gnu.lto_.symtab.9019c461aa2b32df 000000c1  00000000  00000000  000008ad  2**0
                  CONTENTS, READONLY, EXCLUDE
 15 .gnu.lto_.opts 00000099  00000000  00000000  0000096e  2**0
                  CONTENTS, READONLY, EXCLUDE
 16 .comment      00000012  00000000  00000000  00000a07  2**0
                  CONTENTS, READONLY

new.cpp.o:     file format elf32-avr

Sections:
Idx Name          Size      VMA       LMA       File off  Algn
  0 .text         00000000  00000000  00000000  00000034  2**0
                  CONTENTS, ALLOC, LOAD, READONLY, CODE
  1 .data         00000000  00000000  00000000  00000034  2**0
                  CONTENTS, ALLOC, LOAD, DATA
  2 .bss          00000000  00000000  00000000  00000034  2**0
                  ALLOC
  3 .gnu.lto_.profile.e11dfca86d7a6729 00000013  00000000  00000000  00000034  2**0
                  CONTENTS, READONLY, EXCLUDE
  4 .gnu.lto_.jmpfuncs.e11dfca86d7a6729 00000022  00000000  00000000  00000047  2**0
                  CONTENTS, READONLY, EXCLUDE
  5 .gnu.lto_.inline.e11dfca86d7a6729 00000036  00000000  00000000  00000069  2**0
                  CONTENTS, READONLY, EXCLUDE
  6 .gnu.lto_.pureconst.e11dfca86d7a6729 00000018  00000000  00000000  0000009f  2**0
                  CONTENTS, READONLY, EXCLUDE
  7 .gnu.lto__Znwj.e11dfca86d7a6729 00000151  00000000  00000000  000000b7  2**0
                  CONTENTS, READONLY, EXCLUDE
  8 .gnu.lto__Znaj.e11dfca86d7a6729 00000151  00000000  00000000  00000208  2**0
                  CONTENTS, READONLY, EXCLUDE
  9 .gnu.lto__ZdlPv.e11dfca86d7a6729 0000014c  00000000  00000000  00000359  2**0
                  CONTENTS, READONLY, EXCLUDE
 10 .gnu.lto__ZdaPv.e11dfca86d7a6729 0000014e  00000000  00000000  000004a5  2**0
                  CONTENTS, READONLY, EXCLUDE
 11 .gnu.lto_.symbol_nodes.e11dfca86d7a6729 0000004b  00000000  00000000  000005f3  2**0
                  CONTENTS, READONLY, EXCLUDE
 12 .gnu.lto_.refs.e11dfca86d7a6729 0000000f  00000000  00000000  0000063e  2**0
                  CONTENTS, READONLY, EXCLUDE
 13 .gnu.lto_.decls.e11dfca86d7a6729 00000445  00000000  00000000  0000064d  2**0
                  CONTENTS, READONLY, EXCLUDE
 14 .gnu.lto_.symtab.e11dfca86d7a6729 00000056  00000000  00000000  00000a92  2**0
                  CONTENTS, READONLY, EXCLUDE
 15 .gnu.lto_.opts 00000099  00000000  00000000  00000ae8  2**0
                  CONTENTS, READONLY, EXCLUDE
 16 .comment      00000012  00000000  00000000  00000b81  2**0
                  CONTENTS, READONLY
