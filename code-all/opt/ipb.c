#include "combine.h"

/* Combining functions */

char combine1_descr[] = "combine1: Maximum use of data abstraction";
/* $begin combine1 */
/* Implementation with maximum use of data abstraction */
void combine1(vec_ptr v, data_t *dest)
{
    long int i;

    *dest = IDENT;
    for (i = 0; i < vec_length(v); i++) {
	data_t val;
	get_vec_element(v, i, &val);
	/* $begin combineline */
	*dest = *dest OPER val;
	/* $end combineline */
    }
}
/* $end combine1 */

char combine2_descr[] = "combine2: Take vec_length() out of loop";
/* $begin combine2 */
/* Move call to vec_length out of loop */
void combine2(vec_ptr v, data_t *dest)
{
    long int i;
    long int length = vec_length(v);

    *dest = IDENT;
    for (i = 0; i < length; i++) {
	data_t val;
	get_vec_element(v, i, &val);
	*dest = *dest OPER val;
    }
}
/* $end combine2 */

char combine3_descr[] = "combine3: Array reference to vector data";
/* $begin combine3 */
/* Direct access to vector data */
void combine3(vec_ptr v, data_t *dest)
{
    long int i;
    long int length = vec_length(v);
    data_t *data = get_vec_start(v);

    *dest = IDENT;
    for (i = 0; i < length; i++) {
	*dest = *dest OPER data[i];
    }
}
/* $end combine3 */

char combine3w_descr[] = "combine3w: Update *dest within loop only with write";
/* $begin combine3w */
/* Make sure dest updated on each iteration */
void combine3w(vec_ptr v, data_t *dest)
{
    long int i;
    long int length = vec_length(v);
    data_t *data = get_vec_start(v);
    data_t acc = IDENT;

    for (i = 0; i < length; i++) {
	acc = acc OPER data[i];
	*dest = acc;
    }
}
/* $end combine3w */

char combine4_descr[] = "combine4: Array reference, accumulate in temporary";
/* $begin combine4 */
/* Accumulate result in local variable */
void combine4(vec_ptr v, data_t *dest)
{
    long int i;
    long int length = vec_length(v);
    data_t *data = get_vec_start(v);
    data_t acc = IDENT;

    for (i = 0; i < length; i++) {
	acc = acc OPER data[i];
    }
    *dest = acc;
}
/* $end combine4 */

char combine4b_descr[] = "combine4b: Include bonds check in loop";
/* $begin combine4b */
/* Include bounds check in loop */
void combine4b(vec_ptr v, data_t *dest)
{
    long int i;
    long int length = vec_length(v);
    data_t acc = IDENT;

    for (i = 0; i < length; i++) {
	if (i >= 0 && i < v->len) {
	    acc = acc OPER v->data[i];
	}
    }
    *dest = acc;
}
/* $end combine4b */


char combine4p_descr[] = "combine4p: Pointer reference, accumulate in temporary";
/* $begin combine4p */
/* Accumulate in local variable, pointer version */
void combine4p(vec_ptr v, data_t *dest)
{
    long int length = vec_length(v);
    data_t *data = get_vec_start(v);
    data_t *dend = data+length;
    data_t acc = IDENT;

    for (; data < dend; data++)
	acc = acc OPER *data;
    *dest = acc;
}
/* $end combine4p */


char combine5_descr[] = "combine5: Array code, unrolled by 2";
/* $begin combine5 */
/* Unroll loop by 2 */
void combine5(vec_ptr v, data_t *dest)
{
    long int i;
    long int length = vec_length(v);
    long int limit = length-1;
    data_t *data = get_vec_start(v);
    data_t acc = IDENT;

    /* Combine 2 elements at a time */
    for (i = 0; i < limit; i+=2) {
      /* $begin combine5-update */
	acc = (acc OPER data[i]) OPER data[i+1];
      /* $end combine5-update */
    }

    /* Finish any remaining elements */
    for (; i < length; i++) {
	acc = acc OPER data[i];
    }
    *dest = acc;
}
/* $end combine5 */

char unroll3a_descr[] = "unroll3a: Array code, unrolled by 3";
void unroll3a_combine(vec_ptr v, data_t *dest)
{
    long int i;
    long int length = vec_length(v);
    long int limit = length-2;
    data_t *data = get_vec_start(v);
    data_t acc = IDENT;

    /* Combine 3 elements at a time */
    for (i = 0; i < limit; i+=3) {
	acc = acc OPER data[i];
	acc = acc OPER data[i+1];
	acc = acc OPER data[i+2];
    }

    /* Finish any remaining elements */
    for (; i < length; i++) {
	acc = acc OPER data[i];
    }
    *dest = acc;
}


char combine5p_descr[] = "combine5p: Pointer code, unrolled by 2, for loop";
/* $begin combine5p */
/* Unroll loop by 2, pointer version */
void combine5p(vec_ptr v, data_t *dest)
{
    data_t *data = get_vec_start(v);
    data_t *dend = data+vec_length(v);
    data_t *dlimit = dend-1;
    data_t acc = IDENT;

    /* Combine 3 elements at a time */
    for (; data < dlimit; data += 2) {
	acc = acc OPER data[0] OPER data[1];
    }

    /* Finish any remaining elements */
    for (; data < dend; data++) {
	acc = acc OPER data[0];
    }
    *dest = acc;
}
/* $end combine5p */

char unroll2aw_descr[] = "unroll2aw: Array code, unrolled by 2, while loop";
void unroll2aw_combine(vec_ptr v, data_t *dest)
{
    long int i = 0;
    long int length = vec_length(v);
    long int limit = length-1;
    data_t *data = get_vec_start(v);
    data_t acc = IDENT;

    /* Combine 2 elements at a time */
    while (i < limit) {
	acc = acc OPER data[i];
	i+= 2;
	acc = acc OPER data[i-1];
    }

    /* Finish any remaining elements */
    for (; i < length; i++) {
	acc = acc OPER data[i];
    }
    *dest = acc;
}


char unroll4a_descr[] = "unroll4a: Array code, unrolled by 4";
void unroll4a_combine(vec_ptr v, data_t *dest)
{
    long int i;
    long int length = vec_length(v);
    long int limit = length-3;
    data_t *data = get_vec_start(v);
    data_t acc = IDENT;

    /* Combine 4 elements at a time */
    for (i = 0; i < limit; i+=4) {
	acc = acc OPER data[i] OPER data[i+1];
	acc = acc OPER data[i+2] OPER data[i+3];
    }

    /* Finish any remaining elements */
    for (; i < length; i++) {
	acc = acc OPER data[i];
    }
    *dest = acc;
}

char unroll5a_descr[] = "unroll5a: Array code, unrolled by 5";
#if 0
/* $begin unroll5 */
void unroll5(vec_ptr v, data_t *dest)
/* $end unroll5 */
#else
void unroll5a_combine(vec_ptr v, data_t *dest)
#endif
/* $begin unroll5 */
{
    long int i;
    long int length = vec_length(v);
    long int limit = length-4;
    data_t *data = get_vec_start(v);
    data_t acc = IDENT;

    /* Combine 5 elements at a time */
    for (i = 0; i < limit; i+=5) {
	acc = acc OPER data[i]   OPER data[i+1];
	acc = acc OPER data[i+2] OPER data[i+3];
	acc = acc OPER data[i+4];
    }

    /* Finish any remaining elements */
    for (; i < length; i++) {
	acc = acc OPER data[i];
    }
    *dest = acc;
}
/* $end unroll5 */

char unroll6a_descr[] = "unroll6a: Array code, unrolled by 6";
void unroll6a_combine(vec_ptr v, data_t *dest)
{
    long int i;
    long int length = vec_length(v);
    long int limit = length-5;
    data_t *data = get_vec_start(v);
    data_t acc = IDENT;

    /* Combine 6 elements at a time */
    for (i = 0; i < limit; i+=6) {
	acc = acc OPER data[i] OPER data[i+1];
	acc = acc OPER data[i+2] OPER data[i+3];
	acc = acc OPER data[i+4] OPER data[i+5];
    }

    /* Finish any remaining elements */
    for (; i < length; i++) {
	acc = acc OPER data[i];
    }
    *dest = acc;
}

char unroll8a_descr[] = "unroll8a: Array code, unrolled by 8";
void unroll8a_combine(vec_ptr v, data_t *dest)
{
    long int i;
    long int length = vec_length(v);
    long int limit = length-7;
    data_t *data = get_vec_start(v);
    data_t acc = IDENT;

    /* Combine 8 elements at a time */
    for (i = 0; i < limit; i+=8) {
	acc = acc OPER data[i] OPER data[i+1];
	acc = acc OPER data[i+2] OPER data[i+3];
	acc = acc OPER data[i+4] OPER data[i+5];
	acc = acc OPER data[i+6] OPER data[i+7];
    }

    /* Finish any remaining elements */
    for (; i < length; i++) {
	acc = acc OPER data[i];
    }
    *dest = acc;
}

char unroll16a_descr[] = "unroll16a: Array code, unrolled by 16";
void unroll16a_combine(vec_ptr v, data_t *dest)
{
    long int i;
    long int length = vec_length(v);
    long int limit = length-15;
    data_t *data = get_vec_start(v);
    data_t acc = IDENT;

    /* Combine 16 elements at a time */
    for (i = 0; i < limit; i+=16) {
	acc = acc OPER data[i] OPER data[i+1];
	acc = acc OPER data[i+2] OPER data[i+3];
	acc = acc OPER data[i+4] OPER data[i+5];
	acc = acc OPER data[i+6] OPER data[i+7];
	acc = acc OPER data[i+8] OPER data[i+9];
	acc = acc OPER data[i+10] OPER data[i+11];
	acc = acc OPER data[i+12] OPER data[i+13];
	acc = acc OPER data[i+14] OPER data[i+15];
    }

    /* Finish any remaining elements */
    for (; i < length; i++) {
	acc = acc OPER data[i];
    }
    *dest = acc;
}

char unroll2_descr[] = "unroll2: Pointer code, unrolled by 2";
void unroll2_combine(vec_ptr v, data_t *dest)
{
    long int length = vec_length(v);
    data_t *data = get_vec_start(v);
    int over = length%2;
    data_t *dend = data+length-over;
    data_t acc = IDENT;

    while (data < dend) {
	acc = acc OPER data[0];
	acc = acc OPER data[1];
	data += 2;
    }
    dend += over;
    while (data < dend) {
	acc = acc OPER *data;
	data ++;
    }
    *dest = acc;
}


char unroll3_descr[] = "unroll3: Pointer code, unrolled by 3";
void unroll3_combine(vec_ptr v, data_t *dest)
{
    long int length = vec_length(v);
    data_t *data = get_vec_start(v);
    data_t *dend = data+length-2;
    data_t acc = IDENT;

    while (data < dend) {
	acc = acc OPER data[0];
	acc = acc OPER data[1];
	acc = acc OPER data[2];
	data += 3;
    }
    dend += 2;
    while (data < dend) {
	acc = acc OPER *data;
	data ++;
    }
    *dest = acc;
}


char unroll4_descr[] = "unroll4: Pointer code, unrolled by 4";
void unroll4_combine(vec_ptr v, data_t *dest)
{
    long int length = vec_length(v);
    data_t *data = get_vec_start(v);
    data_t *dend = data+length-3;
    data_t acc = IDENT;

    while (data < dend) {
	acc = acc OPER data[0];
	acc = acc OPER data[1];
	acc = acc OPER data[2];
	acc = acc OPER data[3];
	data += 4;
    }
    dend += 3;
    while (data < dend) {
	acc = acc OPER *data;
	data ++;
    }
    *dest = acc;
}

char unroll8_descr[] = "unroll8: Pointer code, unrolled by 8";
void unroll8_combine(vec_ptr v, data_t *dest)
{
    long int length = vec_length(v);
    data_t *data = get_vec_start(v);
    int over = length%8;
    data_t *dend = data+length-over;
    data_t acc = IDENT;

    while (data < dend) {
	acc = acc OPER data[0];
	acc = acc OPER data[1];
	acc = acc OPER data[2];
	acc = acc OPER data[3];
	acc = acc OPER data[4];
	acc = acc OPER data[5];
	acc = acc OPER data[6];
	acc = acc OPER data[7];
	data += 8;
    }
    dend += over;
    while (data < dend) {
	acc = acc OPER *data;
	data ++;
    }
    *dest = acc;
}

char unroll16_descr[] = "unroll16: Pointer code, unrolled by 16";
void unroll16_combine(vec_ptr v, data_t *dest)
{
    long int length = vec_length(v);
    data_t *data = get_vec_start(v);
    int over = length%16;
    data_t *dend = data+length-over;
    data_t acc = IDENT;

    while (data < dend) {
	acc = acc OPER data[0];
	acc = acc OPER data[1];
	acc = acc OPER data[2];
	acc = acc OPER data[3];
	acc = acc OPER data[4];
	acc = acc OPER data[5];
	acc = acc OPER data[6];
	acc = acc OPER data[7];
	acc = acc OPER data[8];
	acc = acc OPER data[9];
	acc = acc OPER data[10];
	acc = acc OPER data[11];
	acc = acc OPER data[12];
	acc = acc OPER data[13];
	acc = acc OPER data[14];
	acc = acc OPER data[15];
	data += 16;
    }
    dend += over;
    while (data < dend) {
	acc = acc OPER *data;
	data ++;
    }
    *dest = acc;
}


char combine6_descr[] = "combine6: Array code, unrolled by 2, Superscalar x2";
/* $begin combine6 */
/* Unroll loop by 2, 2-way parallelism */
void combine6(vec_ptr v, data_t *dest)
{
    long int i;
    long int length = vec_length(v);
    long int limit = length-1;
    data_t *data = get_vec_start(v);
    data_t acc0 = IDENT;
    data_t acc1 = IDENT;

    /* Combine 2 elements at a time */
    for (i = 0; i < limit; i+=2) {
	acc0 = acc0 OPER data[i]; 
	acc1 = acc1 OPER data[i+1];
    }

    /* Finish any remaining elements */
    for (; i < length; i++) {
	acc0 = acc0 OPER data[i];
    }
    *dest = acc0 OPER acc1;
}
/* $end combine6 */

char unroll4x2a_descr[] = "unroll4x2a: Array code, unrolled by 4, Superscalar x2";
void unroll4x2a_combine(vec_ptr v, data_t *dest)
{
    long int i;
    long int length = vec_length(v);
    long int limit = length-3;
    data_t *data = get_vec_start(v);
    data_t acc = IDENT;
    data_t y = IDENT;

    /* Combine 4 elements at a time */
    for (i = 0; i < limit; i+=4) {
	acc = acc OPER data[i]; y = y OPER data[i+1];
	acc = acc OPER data[i+2]; y = y OPER data[i+3];
    }

    /* Finish any remaining elements */
    for (; i < length; i++) {
	acc = acc OPER data[i];
    }
    *dest = acc OPER y;
}


char unroll8x2a_descr[] = "unroll8x2a: Array code, unrolled by 8, Superscalar x2";
void unroll8x2a_combine(vec_ptr v, data_t *dest)
{
    long int i;
    long int length = vec_length(v);
    long int limit = length-7;
    data_t *data = get_vec_start(v);
    data_t acc = IDENT;
    data_t y = IDENT;

    /* Combine 8 elements at a time */
    for (i = 0; i < limit; i+=8) {
	acc = acc OPER data[i]; y = y OPER data[i+1];
	acc = acc OPER data[i+2]; y = y OPER data[i+3];
	acc = acc OPER data[i+4]; y = y OPER data[i+5];
	acc = acc OPER data[i+6]; y = y OPER data[i+7];
    }

    /* Finish any remaining elements */
    for (; i < length; i++) {
	acc = acc OPER data[i];
    }
    *dest = acc OPER y;
}

char unroll3x3a_descr[] = "unroll3x3a: Array code, unrolled by 3, Superscalar x3";
void unroll3x3a_combine(vec_ptr v, data_t *dest)
{
    long int i;
    long int length = vec_length(v);
    long int limit = length-2;
    data_t *data = get_vec_start(v);
    data_t acc0 = IDENT;
    data_t acc1 = IDENT;
    data_t acc2 = IDENT;

    /* Combine 4 elements at a time */
    for (i = 0; i < limit; i+=3) {
	acc0 = acc0 OPER data[i]; acc1 = acc1 OPER data[i+1];
	acc2 = acc2 OPER data[i+2];
    }

    /* Finish any remaining elements */
    for (; i < length; i++) {
	acc0 = acc0 OPER data[i];
    }
    *dest = acc0 OPER acc1 OPER acc2;
}


char unroll4x4a_descr[] = "unroll4x4a: Array code, unrolled by 4, Superscalar x4";
void unroll4x4a_combine(vec_ptr v, data_t *dest)
{
    long int i;
    long int length = vec_length(v);
    long int limit = length-3;
    data_t *data = get_vec_start(v);
    data_t acc0 = IDENT;
    data_t acc1 = IDENT;
    data_t acc2 = IDENT;
    data_t acc3 = IDENT;

    /* Combine 4 elements at a time */
    for (i = 0; i < limit; i+=4) {
	acc0 = acc0 OPER data[i]; acc1 = acc1 OPER data[i+1];
	acc2 = acc2 OPER data[i+2]; acc3 = acc3 OPER data[i+3];
    }

    /* Finish any remaining elements */
    for (; i < length; i++) {
	acc0 = acc0 OPER data[i];
    }
    *dest = acc0 OPER acc1 OPER acc2 OPER acc3;

}

char unroll8x4a_descr[] = "unroll8x4a: Array code, unrolled by 8, Superscalar x4";
void unroll8x4a_combine(vec_ptr v, data_t *dest)
{
    long int i;
    long int length = vec_length(v);
    long int limit = length-7;
    data_t *data = get_vec_start(v);
    data_t acc0 = IDENT;
    data_t acc1 = IDENT;
    data_t acc2 = IDENT;
    data_t acc3 = IDENT;

    /* Combine 8 elements at a time */
    for (i = 0; i < limit; i+=8) {
	acc0 = acc0 OPER data[i];   acc1 = acc1 OPER data[i+1];
	acc2 = acc2 OPER data[i+2]; acc3 = acc3 OPER data[i+3];
	acc0 = acc0 OPER data[i+4]; acc1 = acc1 OPER data[i+5];
	acc2 = acc2 OPER data[i+6]; acc3 = acc3 OPER data[i+7];
    }

    /* Finish any remaining elements */
    for (; i < length; i++) {
	acc0 = acc0 OPER data[i];
    }
    *dest = acc0 OPER acc1 OPER acc2 OPER acc3;
}

char unroll12x6a_descr[] = "unroll2x6a: Array code, unrolled by 12, Superscalar x6";
void unroll12x6a_combine(vec_ptr v, data_t *dest)
{
    long int i;
    long int length = vec_length(v);
    long int limit = length-11;
    data_t *data = get_vec_start(v);
    data_t acc0 = IDENT;
    data_t acc1 = IDENT;
    data_t acc2 = IDENT;
    data_t acc3 = IDENT;
    data_t acc4 = IDENT;
    data_t acc5 = IDENT;

    /* Combine 12 elements at a time */
    for (i = 0; i < limit; i+=12) {
	acc0 = acc0 OPER data[i];
	acc0 = acc0 OPER data[i+6]; 
	acc1 = acc1 OPER data[i+1];
	acc1 = acc1 OPER data[i+7];
	acc2 = acc2 OPER data[i+2];
	acc2 = acc2 OPER data[i+8]; 
	acc3 = acc3 OPER data[i+3];
	acc3 = acc3 OPER data[i+9];
	acc4 = acc4 OPER data[i+4]; 
	acc4 = acc4 OPER data[i+10]; 
	acc5 = acc5 OPER data[i+5];
	acc5 = acc5 OPER data[i+11];
    }

    /* Finish any remaining elements */
    for (; i < length; i++) {
	acc0 = acc0 OPER data[i];
    }
    *dest = (acc0 OPER acc1) OPER (acc2 OPER acc3) OPER (acc4 OPER acc5);
}

char unroll12x12a_descr[] = "unroll12x12a: Array code, unrolled by 12, Superscalar x12";
void unroll12x12a_combine(vec_ptr v, data_t *dest)
{
    long int i;
    long int length = vec_length(v);
    long int limit = length-11;
    data_t *data = get_vec_start(v);
    data_t acc0 = IDENT;
    data_t acc1 = IDENT;
    data_t acc2 = IDENT;
    data_t acc3 = IDENT;
    data_t acc4 = IDENT;
    data_t acc5 = IDENT;
    data_t acc6 = IDENT;
    data_t acc7 = IDENT;
    data_t acc8 = IDENT;
    data_t acc9 = IDENT;
    data_t acc10 = IDENT;
    data_t acc11= IDENT;

    /* Combine 12 elements at a time */
    for (i = 0; i < limit; i+=12) {
	acc0 = acc0 OPER data[i];
	acc6 = acc6 OPER data[i+6]; 
	acc1 = acc1 OPER data[i+1];
	acc7 = acc7 OPER data[i+7];
	acc2 = acc2 OPER data[i+2];
	acc8 = acc8 OPER data[i+8]; 
	acc3 = acc3 OPER data[i+3];
	acc9 = acc9 OPER data[i+9];
	acc4 = acc4 OPER data[i+4]; 
	acc10 = acc10 OPER data[i+10]; 
	acc5 = acc5 OPER data[i+5];
	acc11 = acc11 OPER data[i+11];
    }

    /* Finish any remaining elements */
    for (; i < length; i++) {
	acc0 = acc0 OPER data[i];
    }
    *dest = (acc0 OPER acc1) OPER (acc2 OPER acc3) OPER (acc4 OPER acc5)
	OPER (acc6 OPER acc7) OPER (acc8 OPER acc9) OPER (acc10 OPER acc11);
}

char unroll5x5a_descr[] = "unroll5x5a: Array code, unrolled by 5, Superscalar x5";
void unroll5x5a_combine(vec_ptr v, data_t *dest)
{
    long int i;
    long int length = vec_length(v);
    long int limit = length-4;
    data_t *data = get_vec_start(v);
    data_t acc0 = IDENT;
    data_t acc1 = IDENT;
    data_t acc2 = IDENT;
    data_t acc3 = IDENT;
    data_t acc4 = IDENT;

    /* Combine 5 elements at a time */
    for (i = 0; i < limit; i+=5) {
	acc0 = acc0 OPER data[i];   acc1 = acc1 OPER data[i+1];
	acc2 = acc2 OPER data[i+2]; acc3 = acc3 OPER data[i+3];
	acc4 = acc4 OPER data[i+4];
    }

    /* Finish any remaining elements */
    for (; i < length; i++) {
	acc0 = acc0 OPER data[i];
    }
    *dest = acc0 OPER acc1 OPER acc2 OPER acc3 OPER acc4;
}

char unroll6x6a_descr[] = "unroll6x6a: Array code, unrolled by 6, Superscalar x6";
void unroll6x6a_combine(vec_ptr v, data_t *dest)
{
    long int i;
    long int length = vec_length(v);
    long int limit = length-5;
    data_t *data = get_vec_start(v);
    data_t acc0 = IDENT;
    data_t acc1 = IDENT;
    data_t acc2 = IDENT;
    data_t acc3 = IDENT;
    data_t acc4 = IDENT;
    data_t acc5 = IDENT;

    /* Combine 6 elements at a time */
    for (i = 0; i < limit; i+=6) {
	acc0 = acc0 OPER data[i];   acc1 = acc1 OPER data[i+1];
	acc2 = acc2 OPER data[i+2]; acc3 = acc3 OPER data[i+3];
	acc4 = acc4 OPER data[i+4]; acc5 = acc5 OPER data[i+5];
    }

    /* Finish any remaining elements */
    for (; i < length; i++) {
	acc0 = acc0 OPER data[i];
    }
    *dest = acc0 OPER acc1 OPER acc2 OPER acc3 OPER acc4 OPER acc5;
}

char unroll8x8a_descr[] = "unroll8x8a: Array code, unrolled by 8, Superscalar x8";
void unroll8x8a_combine(vec_ptr v, data_t *dest)
{
    long int i;
    long int length = vec_length(v);
    long int limit = length-7;
    data_t *data = get_vec_start(v);
    data_t acc0 = IDENT;
    data_t acc1 = IDENT;
    data_t acc2 = IDENT;
    data_t acc3 = IDENT;
    data_t acc4 = IDENT;
    data_t acc5 = IDENT;
    data_t acc6 = IDENT;
    data_t acc7 = IDENT;

    /* Combine 8 elements at a time */
    for (i = 0; i < limit; i+=8) {
	acc0 = acc0 OPER data[i];   acc1 = acc1 OPER data[i+1];
	acc2 = acc2 OPER data[i+2]; acc3 = acc3 OPER data[i+3];
	acc4 = acc4 OPER data[i+4]; acc5 = acc5 OPER data[i+5];
	acc6 = acc6 OPER data[i+6]; acc7 = acc7 OPER data[i+7];
    }

    /* Finish any remaining elements */
    for (; i < length; i++) {
	acc0 = acc0 OPER data[i];
    }
    *dest = acc0 OPER acc1 OPER acc2 OPER acc3 OPER acc4 OPER acc5 OPER acc6 OPER acc7;
}

char unroll10x10a_descr[] = "unroll10x10a: Array code, unrolled by 10, Superscalar x10";
void unroll10x10a_combine(vec_ptr v, data_t *dest)
{
    long int i;
    long int length = vec_length(v);
    long int limit = length-9;
    data_t *data = get_vec_start(v);
    data_t acc0 = IDENT;
    data_t acc1 = IDENT;
    data_t acc2 = IDENT;
    data_t acc3 = IDENT;
    data_t acc4 = IDENT;
    data_t acc5 = IDENT;
    data_t acc6 = IDENT;
    data_t acc7 = IDENT;
    data_t acc8 = IDENT;
    data_t acc9 = IDENT;

    /* Combine 10 elements at a time */
    for (i = 0; i < limit; i+=10) {
	acc0 = acc0 OPER data[i];   acc1 = acc1 OPER data[i+1];
	acc2 = acc2 OPER data[i+2]; acc3 = acc3 OPER data[i+3];
	acc4 = acc4 OPER data[i+4]; acc5 = acc5 OPER data[i+5];
	acc6 = acc6 OPER data[i+6]; acc7 = acc7 OPER data[i+7];
	acc8 = acc8 OPER data[i+8]; acc9 = acc9 OPER data[i+9];
    }

    /* Finish any remaining elements */
    for (; i < length; i++) {
	acc0 = acc0 OPER data[i];
    }
    *dest = acc0 OPER acc1 OPER acc2 OPER acc3 OPER acc4 OPER acc5 OPER acc6 OPER acc7
	OPER acc8 OPER acc9;
}

char unrollx2as_descr[] = "unrollx2as: Array code, Unroll x2, Superscalar x2, noninterleaved";
void unrollx2as_combine(vec_ptr v, data_t *dest)
{
    long int i;
    long int length = vec_length(v);
    long int limit = length/2;
    data_t *data = get_vec_start(v);
    data_t *data2 = data+limit;
    data_t acc = IDENT;
    data_t y = IDENT;

    /* Combine 2 elements at a time */
    for (i = 0; i < limit; i++) {
	acc = acc OPER data[i]; y = y OPER data2[i];
    }

    /* Finish any remaining elements */
    for (i = limit*2; i < length; i++) {
	y = y OPER data[i];
    }
    *dest = acc OPER y;
}

char unroll4x2as_descr[] = "unroll4x2as: Array code, Unroll x4, Superscalar x2, noninterleaved";
void unroll4x2as_combine(vec_ptr v, data_t *dest)
{
    long int i;
    long int length = vec_length(v);
    long int limit = length/2;
    data_t *data = get_vec_start(v);
    data_t *data2 = data+limit;
    data_t acc = IDENT;
    data_t y = IDENT;

    /* Combine 2 elements at a time */
    for (i = 0; i < limit; i++) {
	acc = acc OPER data[i]; y = y OPER data2[i];
    }

    /* Finish any remaining elements */
    for (i = limit*2; i < length; i++) {
	y = y OPER data[i];
    }
    *dest = acc OPER y;
}



char unroll8x2_descr[] = "unroll8x2: Pointer code, unrolled by 8, Superscalar x2";
void unroll8x2_combine(vec_ptr v, data_t *dest)
{
    long int length = vec_length(v);
    data_t *data = get_vec_start(v);
    data_t *dend = data+length-7;
    data_t acc = IDENT;
    data_t y = IDENT;

    while (data < dend) {
	acc = acc OPER data[0];
	y = y OPER data[1];
	acc = acc OPER data[2];
	y = y OPER data[3];
	acc = acc OPER data[4];
	y = y OPER data[5];
	acc = acc OPER data[6];
	y = y OPER data[7];
	data += 8;
    }
    dend += 7;
    while (data < dend) {
	acc = acc OPER *data;
	data ++;
    }
    *dest = acc OPER y;
}

char unroll9x3_descr[] = "unroll9x3: Pointer code, unrolled by 9, Superscalar x3";
void unroll9x3_combine(vec_ptr v, data_t *dest)
{
    long int length = vec_length(v);
    data_t *data = get_vec_start(v);
    data_t *dend = data+length-8;
    data_t acc = IDENT;
    data_t y = IDENT;
    data_t z = IDENT;

    while (data < dend) {
	acc = acc OPER data[0];
	y = y OPER data[1];
	z = z OPER data[2];
	acc = acc OPER data[3];
	y = y OPER data[4];
	z = z OPER data[5];
	acc = acc OPER data[6];
	y = y OPER data[7];
	z = z OPER data[8];
	data += 9;
    }
    dend += 8;
    while (data < dend) {
	acc = acc OPER *data;
	data ++;
    }
    *dest = acc OPER y OPER z; 
}


char unroll8x4_descr[] = "unroll8x4: Pointer code, unrolled by 8, Superscalar x4";
void unroll8x4_combine(vec_ptr v, data_t *dest)
{
    long int length = vec_length(v);
    data_t *data = get_vec_start(v);
    data_t *dend = data+length-7;
    data_t w = IDENT;
    data_t acc = IDENT;
    data_t y = IDENT;
    data_t z = IDENT;

    while (data < dend) {
	w = w OPER data[0];
	acc = acc OPER data[1];
	y = y OPER data[2];
	z = z OPER data[3];
	w = w OPER data[4];
	acc = acc OPER data[5];
	y = y OPER data[6];
	z = z OPER data[7];
	data += 8;
    }
    dend += 7;
    while (data < dend) {
	w = w OPER *data;
	data ++;
    }
    *dest = w OPER acc OPER y OPER z;
}

char unroll8x8_descr[] = "unroll8x8: Pointer code, unrolled by 8, Superscalar x8";
void unroll8x8_combine(vec_ptr v, data_t *dest)
{
    long int length = vec_length(v);
    data_t *data = get_vec_start(v);
    data_t *dend = data+length-7;
    data_t a = IDENT;
    data_t b = IDENT;
    data_t c = IDENT;
    data_t d = IDENT;
    data_t w = IDENT;
    data_t acc = IDENT;
    data_t y = IDENT;
    data_t z = IDENT;

    while (data < dend) {
	a = a OPER data[0];
	b = b OPER data[1];
	c = c OPER data[2];
	d = d OPER data[3];
	w = w OPER data[4];
	acc = acc OPER data[5];
	y = y OPER data[6];
	z = z OPER data[7];
	data += 8;
    }
    dend += 7;
    while (data < dend) {
	a = a OPER *data;
	data ++;
    }
    *dest = a OPER b OPER c OPER d OPER w OPER acc OPER y OPER z;
}

char combine7_descr[] = "combine7: Array code, unrolled by 2, different associativity";
/* $begin combine7 */
/* Change associativity of combining operation */
void combine7(vec_ptr v, data_t *dest)
{
    long int i;
    long int length = vec_length(v);
    long int limit = length-1;
    data_t *data = get_vec_start(v);
    data_t acc = IDENT;

    /* Combine 2 elements at a time */
    for (i = 0; i < limit; i+=2) {
      /* $begin combine7-update */
	acc = acc OPER (data[i] OPER data[i+1]);
      /* $end combine7-update */
    }

    /* Finish any remaining elements */
    for (; i < length; i++) {
	acc = acc OPER data[i];
    }
    *dest = acc;
}
/* $end combine7 */

char unroll3aa_descr[] = "unroll3aa: Array code, unrolled by 3, Different Associativity";
void unroll3aa_combine(vec_ptr v, data_t *dest)
{
    long int i;
    long int length = vec_length(v);
    long int limit = length-2;
    data_t *data = get_vec_start(v);
    data_t acc = IDENT;

    /* Combine 3 elements at a time */
    for (i = 0; i < limit; i+=3) {
	acc = acc OPER (data[i] OPER data[i+1] OPER data[i+2]);
    }

    /* Finish any remaining elements */
    for (; i < length; i++) {
	acc = acc OPER data[i];
    }
    *dest = acc;
}

char unroll4aa_descr[] = "unroll4aa: Array code, unrolled by 4, Different Associativity";
void unroll4aa_combine(vec_ptr v, data_t *dest)
{
    long int i;
    long int length = vec_length(v);
    long int limit = length-3;
    data_t *data = get_vec_start(v);
    data_t acc = IDENT;

    /* Combine 4 elements at a time */
    for (i = 0; i < limit; i+=4) {
	data_t t1 = data[i] OPER data[i+1];
	data_t t2 = data[i+2] OPER data[i+3];
	acc = acc OPER (t1 OPER t2); 
    }

    /* Finish any remaining elements */
    for (; i < length; i++) {
	acc = acc OPER data[i];
    }
    *dest = acc;
}

char unroll5aa_descr[] = "unroll5aa: Array code, unrolled by 5, Different Associativity";
void unroll5aa_combine(vec_ptr v, data_t *dest)
{
    long int i;
    long int length = vec_length(v);
    long int limit = length-4;
    data_t *data = get_vec_start(v);
    data_t acc = IDENT;

    /* Combine 5 elements at a time */
    for (i = 0; i < limit; i+=5) {
	data_t t1 = data[i] OPER data[i+1];
	data_t t2 = data[i+2] OPER data[i+3];
	data_t t3 = data[i+4];
	acc = acc OPER (t1 OPER t2 OPER t3); 
    }

    /* Finish any remaining elements */
    for (; i < length; i++) {
	acc = acc OPER data[i];
    }
    *dest = acc;
}

char unroll6aa_descr[] = "unroll6aa: Array code, unrolled by 6, Different Associativity";
void unroll6aa_combine(vec_ptr v, data_t *dest)
{
    long int i;
    long int length = vec_length(v);
    long int limit = length-5;
    data_t *data = get_vec_start(v);
    data_t acc = IDENT;

    /* Combine 6 elements at a time */
    for (i = 0; i < limit; i+=6) {
	data_t t1 = data[i] OPER data[i+1];
	data_t t2 = data[i+2] OPER data[i+3];
	data_t t3 = data[i+4] OPER data[i+5];
	acc = acc OPER (t1 OPER t2 OPER t3); 
    }

    /* Finish any remaining elements */
    for (; i < length; i++) {
	acc = acc OPER data[i];
    }
    *dest = acc;
}

char unroll8aa_descr[] = "unroll8aa: Array code, unrolled by 8, Different Associativity";
void unroll8aa_combine(vec_ptr v, data_t *dest)
{
    long int i;
    long int length = vec_length(v);
    long int limit = length-7;
    data_t *data = get_vec_start(v);
    data_t acc = IDENT;

    /* Combine 8 elements at a time */
    for (i = 0; i < limit; i+=8) {
	data_t t1 = data[i] OPER data[i+1];
	data_t t2 = data[i+2] OPER data[i+3];
	data_t u1 = t1 OPER t2;
	data_t t3 = data[i+4] OPER data[i+5];
	data_t t4 = data[i+6] OPER data[i+7];
	data_t u2 = t3 OPER t4;
	acc = acc OPER (u1 OPER u2); 
    }

    /* Finish any remaining elements */
    for (; i < length; i++) {
	acc = acc OPER data[i];
    }

    *dest = acc;
}

/* Experiment using GCC support for SSE instructions */
#ifdef INT
#define VSIZE 4
#endif

#ifdef DOUBLE
/* $begin simd_double_vsize */
/* Each SSE vector contains 2 elements */
#define VSIZE 2
/* $end simd_double_vsize */
#endif

#ifdef FLOAT
/* $begin simd_float_vsize */
/* Each SSE vector contains 4 elements */
#define VSIZE 4
/* $end simd_double_vsize */
#endif

#ifdef LONG
#define VSIZE 2
#endif

#ifdef CHAR
#define VSIZE 16
#endif


/* $begin simd_double_vsize */
/* $begin simd_float_vsize */
/* Required alignment for SSE data */
#define ALIGN (VSIZE*sizeof(data_t))
/* $end simd_float_vsize */
/* $end simd_double_vsize */


/* $begin simd_vec_t */
typedef data_t vec_t __attribute__ ((vector_size(16)));
/* $end simd_vec_t */

/* $begin simd_pack_t */
typedef union {
    vec_t v;
    data_t d[VSIZE];
} pack_t;
/* $end simd_pack_t */

char simd_v1_descr[] = "simd_v1: SSE code, 1*VSIZE-way parallelism";
/* $begin simd_combine-c */
void simd_v1_combine(vec_ptr v, data_t *dest)
{
    long int i;
    pack_t xfer;
    vec_t accum;
    data_t *data = get_vec_start(v);
    int cnt = vec_length(v);
    data_t result = IDENT;

    /* Initialize accum entries to IDENT */
    for (i = 0; i < VSIZE; i++)
	xfer.d[i] = IDENT;
    accum = xfer.v;

    /* Single step until have memory alignment */
    while (((long) data) % ALIGN && cnt) {
	result = result OPER *data++;
	cnt--;
    }

    /* Step through data with VSIZE-way parallelism */
    while (cnt >= VSIZE) {
	vec_t chunk = *((vec_t *) data);
	accum = accum OPER chunk;
	data += VSIZE;
	cnt -= VSIZE;
    }

    /* Single-step through remaining elements */
    while (cnt) {
	result = result OPER *data++;
	cnt--;
    }

    /* Combine elements of accumulator vector */
    xfer.v = accum;
    for (i = 0; i < VSIZE; i++)
	result = result OPER xfer.d[i];

    /* Store result */
    *dest = result;
}
/* $end simd_combine-c */


char simd_v2_descr[] = "simd_v2: SSE code, 2*VSIZE-way parallelism";
void simd_v2_combine(vec_ptr v, data_t *dest)
{
    long int i;
    pack_t xfer;
    vec_t accum0, accum1;
    data_t *data = get_vec_start(v);
    int cnt = vec_length(v);
    data_t result = IDENT;

    /* Initialize to accum IDENT */
    for (i = 0; i < VSIZE; i++)
	xfer.d[i] = IDENT;
    accum0 = xfer.v;
    accum1 = xfer.v;

    while (((long) data) % ALIGN && cnt) {
	result = result OPER *data++;
	cnt--;
    }

    while (cnt >= 2*VSIZE) {
	vec_t chunk0 = *((vec_t *) data);
	vec_t chunk1 = *((vec_t *) (data+VSIZE));
	accum0 = accum0 OPER chunk0;
	accum1 = accum1 OPER chunk1;
	data += 2*VSIZE;
	cnt -= 2*VSIZE;
    }
    while (cnt) {
	result = result OPER *data++;
	cnt--;
    }
    xfer.v = accum0 OPER accum1;
    for (i = 0; i < VSIZE; i++)
	result = result OPER xfer.d[i];
    *dest = result;
}

char simd_v4_descr[] = "simd_v4: SSE code, 4*VSIZE-way parallelism";
void simd_v4_combine(vec_ptr v, data_t *dest)
{
    long int i;
    pack_t xfer;
    data_t *data = get_vec_start(v);
    int cnt = vec_length(v);
    data_t result = IDENT;

    /* $begin simd_v4_init */
    /* Create 4 accumulators and initialize elements to IDENT */
    vec_t accum0, accum1, accum2, accum3;
    for (i = 0; i < VSIZE; i++)
	xfer.d[i] = IDENT;
    accum0 = xfer.v; accum1 = xfer.v;
    accum2 = xfer.v; accum3 = xfer.v;
    /* $end simd_v4_init */
    
    while (((long) data) % ALIGN && cnt) {
	result = result OPER *data++;
	cnt--;
    }

    /* $begin simd_v4_loop */
    /* Accumulate with 4x VSIZE parallelism */
    while (cnt >= 4*VSIZE) {
	vec_t chunk0 = *((vec_t *) data);
	vec_t chunk1 = *((vec_t *) (data+VSIZE));
	vec_t chunk2 = *((vec_t *) (data+2*VSIZE));
	vec_t chunk3 = *((vec_t *) (data+3*VSIZE));
	accum0 = accum0 OPER chunk0;
	accum1 = accum1 OPER chunk1;
	accum2 = accum2 OPER chunk2;
	accum3 = accum3 OPER chunk3;
	data += 4*VSIZE;
	cnt -= 4*VSIZE;
    }
    /* $end simd_v4_loop */

    while (cnt) {
	result = result OPER *data++;
	cnt--;
    }

    /* $begin simd_v4_merge */
    /* Combine into single accumulator */
    xfer.v = (accum0 OPER accum1) OPER (accum2 OPER accum3);
    /* $endsimd_v4_merge */

    for (i = 0; i < VSIZE; i++)
	result = result OPER xfer.d[i];
    *dest = result;
}

char simd_v8_descr[] = "simd_v8: SSE code, 8*VSIZE-way parallelism";
void simd_v8_combine(vec_ptr v, data_t *dest)
{
    long int i;
    pack_t xfer;
    vec_t accum0, accum1, accum2, accum3, accum4, accum5, accum6, accum7;
    data_t *data = get_vec_start(v);
    int cnt = vec_length(v);
    data_t result = IDENT;

    /* Initialize to accum IDENT */
    for (i = 0; i < VSIZE; i++)
	xfer.d[i] = IDENT;
    accum0 = xfer.v;
    accum1 = xfer.v;
    accum2 = xfer.v;
    accum3 = xfer.v;
    accum4 = xfer.v;
    accum5 = xfer.v;
    accum6 = xfer.v;
    accum7 = xfer.v;
    
    while (((long) data) % ALIGN && cnt) {
	result = result OPER *data++;
	cnt--;
    }

    while (cnt >= 8*VSIZE) {
	vec_t chunk0 = *((vec_t *) data);
	vec_t chunk1 = *((vec_t *) (data+VSIZE));
	vec_t chunk2 = *((vec_t *) (data+2*VSIZE));
	vec_t chunk3 = *((vec_t *) (data+3*VSIZE));
	vec_t chunk4 = *((vec_t *) (data+4*VSIZE));
	vec_t chunk5 = *((vec_t *) (data+5*VSIZE));
	vec_t chunk6 = *((vec_t *) (data+6*VSIZE));
	vec_t chunk7 = *((vec_t *) (data+7*VSIZE));
	accum0 = accum0 OPER chunk0;
	accum1 = accum1 OPER chunk1;
	accum2 = accum2 OPER chunk2;
	accum3 = accum3 OPER chunk3;
	accum4 = accum4 OPER chunk4;
	accum5 = accum5 OPER chunk5;
	accum6 = accum6 OPER chunk6;
	accum7 = accum7 OPER chunk7;
	data += 8*VSIZE;
	cnt -= 8*VSIZE;
    }
    while (cnt) {
	result = result OPER *data++;
	cnt--;
    }
    xfer.v = (accum0 OPER accum1) OPER (accum2 OPER accum3);
    xfer.v = xfer.v OPER (accum4 OPER accum5) OPER (accum6 OPER accum7);
    for (i = 0; i < VSIZE; i++)
	result = result OPER xfer.d[i];
    *dest = result;
}

char simd_v12_descr[] = "simd_v12: SSE code, 12*VSIZE-way parallelism";
void simd_v12_combine(vec_ptr v, data_t *dest)
{
    long int i;
    pack_t xfer;
    vec_t accum0, accum1, accum2, accum3, accum4, accum5, accum6, accum7;
    vec_t accum8, accum9, accum10, accum11;
    data_t *data = get_vec_start(v);
    int cnt = vec_length(v);
    data_t result = IDENT;

    /* Initialize to accum IDENT */
    for (i = 0; i < VSIZE; i++)
	xfer.d[i] = IDENT;
    accum0 = xfer.v;
    accum1 = xfer.v;
    accum2 = xfer.v;
    accum3 = xfer.v;
    accum4 = xfer.v;
    accum5 = xfer.v;
    accum6 = xfer.v;
    accum7 = xfer.v;
    accum8 = xfer.v;
    accum9 = xfer.v;
    accum10 = xfer.v;
    accum11 = xfer.v;
    while (((long) data) % ALIGN && cnt) {
	result = result OPER *data++;
	cnt--;
    }

    while (cnt >= 12*VSIZE) {
	vec_t chunk0 = *((vec_t *) data);
	vec_t chunk1 = *((vec_t *) (data+VSIZE));
	vec_t chunk2 = *((vec_t *) (data+2*VSIZE));
	vec_t chunk3 = *((vec_t *) (data+3*VSIZE));
	vec_t chunk4 = *((vec_t *) (data+4*VSIZE));
	vec_t chunk5 = *((vec_t *) (data+5*VSIZE));
	vec_t chunk6 = *((vec_t *) (data+6*VSIZE));
	vec_t chunk7 = *((vec_t *) (data+7*VSIZE));
	vec_t chunk8 = *((vec_t *) (data+8*VSIZE));
	vec_t chunk9 = *((vec_t *) (data+9*VSIZE));
	vec_t chunk10 = *((vec_t *) (data+10*VSIZE));
	vec_t chunk11 = *((vec_t *) (data+11*VSIZE));
	accum0 = accum0 OPER chunk0;
	accum1 = accum1 OPER chunk1;
	accum2 = accum2 OPER chunk2;
	accum3 = accum3 OPER chunk3;
	accum4 = accum4 OPER chunk4;
	accum5 = accum5 OPER chunk5;
	accum6 = accum6 OPER chunk6;
	accum7 = accum7 OPER chunk7;
	accum8 = accum8 OPER chunk8;
	accum9 = accum9 OPER chunk9;
	accum10 = accum10 OPER chunk10;
	accum11 = accum11 OPER chunk11;
	data += 12*VSIZE;
	cnt -= 12*VSIZE;
    }
    while (cnt) {
	result = result OPER *data++;
	cnt--;
    }
    xfer.v = (accum0 OPER accum1) OPER (accum2 OPER accum3);
    xfer.v = xfer.v OPER (accum4 OPER accum5) OPER (accum6 OPER accum7);
    xfer.v = xfer.v OPER (accum8 OPER accum9) OPER (accum10 OPER accum11);
    for (i = 0; i < VSIZE; i++)
	result = result OPER xfer.d[i];
    *dest = result;
}

/* Same idea, but use different associativity to get parallelism */
char simd_v2a_descr[] = "simd_v2a: SSE code, 2*VSIZE-way parallelism, reassociate";
void simd_v2a_combine(vec_ptr v, data_t *dest)
{
    long int i;
    pack_t xfer;
    vec_t accum;
    data_t *data = get_vec_start(v);
    int cnt = vec_length(v);
    data_t result = IDENT;

    /* Initialize accum to IDENT */
    for (i = 0; i < VSIZE; i++)
	xfer.d[i] = IDENT;
    accum = xfer.v;

    while (((long) data) % ALIGN && cnt) {
	result = result OPER *data++;
	cnt--;
    }

    while (cnt >= 2*VSIZE) {
	vec_t chunk0 = *((vec_t *) data);
	vec_t chunk1 = *((vec_t *) (data+VSIZE));
	accum = accum OPER (chunk0 OPER chunk1);
	data += 2*VSIZE;
	cnt -= 2*VSIZE;
    }
    while (cnt) {
	result = result OPER *data++;
	cnt--;
    }
    xfer.v = accum;
    for (i = 0; i < VSIZE; i++)
	result = result OPER xfer.d[i];
    *dest = result;
}

char simd_v4a_descr[] = "simd_v4a: SSE code, 4*VSIZE-way parallelism, reassociate";
void simd_v4a_combine(vec_ptr v, data_t *dest)
{
    long int i;
    pack_t xfer;
    vec_t accum;
    data_t *data = get_vec_start(v);
    int cnt = vec_length(v);
    data_t result = IDENT;

    /* Initialize accum to IDENT */
    for (i = 0; i < VSIZE; i++)
	xfer.d[i] = IDENT;
    accum = xfer.v;

    while (((long) data) % ALIGN && cnt) {
	result = result OPER *data++;
	cnt--;
    }

    while (cnt >= 4*VSIZE) {
	vec_t chunk0 = *((vec_t *) data);
	vec_t chunk1 = *((vec_t *) (data+VSIZE));
	vec_t chunk2 = *((vec_t *) (data+2*VSIZE));
	vec_t chunk3 = *((vec_t *) (data+3*VSIZE));
	accum = accum OPER
	    ((chunk0 OPER chunk1) OPER (chunk2 OPER chunk3));
	data += 4*VSIZE;
	cnt -= 4*VSIZE;
    }
    while (cnt) {
	result = result OPER *data++;
	cnt--;
    }
    xfer.v = accum;
    for (i = 0; i < VSIZE; i++)
	result = result OPER xfer.d[i];
    *dest = result;
}

char simd_v8a_descr[] = "simd_v8a: SSE code, 8*VSIZE-way parallelism, reassociate";
void simd_v8a_combine(vec_ptr v, data_t *dest)
{
    long int i;
    pack_t xfer;
    vec_t accum;
    data_t *data = get_vec_start(v);
    int cnt = vec_length(v);
    data_t result = IDENT;

    /* Initialize accum to IDENT */
    for (i = 0; i < VSIZE; i++)
	xfer.d[i] = IDENT;
    accum = xfer.v;

    while (((long) data) % ALIGN && cnt) {
	result = result OPER *data++;
	cnt--;
    }

    while (cnt >= 8*VSIZE) {
	vec_t chunk0 = *((vec_t *) data);
	vec_t chunk1 = *((vec_t *) (data+VSIZE));
	vec_t chunk2 = *((vec_t *) (data+2*VSIZE));
	vec_t chunk3 = *((vec_t *) (data+3*VSIZE));
	vec_t chunk4 = *((vec_t *) (data+4*VSIZE));
	vec_t chunk5 = *((vec_t *) (data+5*VSIZE));
	vec_t chunk6 = *((vec_t *) (data+6*VSIZE));
	vec_t chunk7 = *((vec_t *) (data+7*VSIZE));
	accum = accum OPER
	    (((chunk0 OPER chunk1) OPER (chunk2 OPER chunk3))
	     OPER
	     ((chunk4 OPER chunk5) OPER (chunk6 OPER chunk7)));
	data += 8*VSIZE;
	cnt -= 8*VSIZE;
    }
    while (cnt) {
	result = result OPER *data++;
	cnt--;
    }
    xfer.v = accum;
    for (i = 0; i < VSIZE; i++)
	result = result OPER xfer.d[i];
    *dest = result;
}


void register_combiners(void)
{
#ifndef UNROLL_ONLY
    add_combiner(combine1, combine1, combine1_descr);
    add_combiner(combine2, combine1, combine2_descr);
    add_combiner(combine3, combine1, combine3_descr);
    add_combiner(combine3w, combine1, combine3w_descr);
#endif
    add_combiner(combine4, combine1,combine4_descr);
#ifndef UNROLL_ONLY
    add_combiner(combine4b, combine1, combine4b_descr);
    add_combiner(combine4p, combine1, combine4p_descr);
#endif
    add_combiner(combine5, combine1, combine5_descr);
#ifndef UNROLL_ONLY
    add_combiner(combine5p, combine1, combine5p_descr);
    add_combiner(unroll2aw_combine, combine1, unroll2aw_descr);
#endif
    add_combiner(unroll3a_combine, combine1, unroll3a_descr);
    add_combiner(unroll4a_combine, combine1, unroll4a_descr);
    add_combiner(unroll5a_combine, combine1, unroll5a_descr);
    add_combiner(unroll6a_combine, combine1, unroll6a_descr);
    add_combiner(unroll8a_combine, combine1, unroll8a_descr);
    add_combiner(unroll16a_combine, combine1, unroll16a_descr);
#ifndef UNROLL_ONLY
    add_combiner(unroll2_combine, combine1, unroll2_descr);
    add_combiner(unroll3_combine, combine1, unroll3_descr);
    add_combiner(unroll4_combine, combine1, unroll4_descr);
    add_combiner(unroll8_combine, combine1, unroll8_descr);
    add_combiner(unroll16_combine, combine1, unroll16_descr);
    add_combiner(combine6, combine1, combine6_descr);
    add_combiner(unroll4x2a_combine, combine1, unroll4x2a_descr);
    add_combiner(unroll8x2a_combine, combine1, unroll8x2a_descr);
    add_combiner(unroll3x3a_combine, combine1, unroll3x3a_descr);
    add_combiner(unroll4x4a_combine, combine1, unroll4x4a_descr);
    add_combiner(unroll5x5a_combine, combine1, unroll5x5a_descr);
    add_combiner(unroll6x6a_combine, combine1, unroll6x6a_descr);
    add_combiner(unroll8x4a_combine, combine1, unroll8x4a_descr);
    add_combiner(unroll8x8a_combine, combine1, unroll8x8a_descr);
    add_combiner(unroll10x10a_combine, combine1, unroll10x10a_descr);
    add_combiner(unroll12x6a_combine, combine1, unroll12x6a_descr);
    add_combiner(unroll12x12a_combine, combine1, unroll12x12a_descr);
    add_combiner(unroll8x2_combine, combine1, unroll8x2_descr);
    add_combiner(unroll8x4_combine, combine1, unroll8x4_descr);
    add_combiner(unroll8x8_combine, combine1, unroll8x8_descr);
    add_combiner(unroll9x3_combine, combine1, unroll9x3_descr);
    add_combiner(unrollx2as_combine, combine1, unrollx2as_descr);
    add_combiner(combine7, combine1, combine7_descr);
    add_combiner(unroll3aa_combine, combine1, unroll3aa_descr);
    add_combiner(unroll4aa_combine, combine1, unroll4aa_descr);
    add_combiner(unroll5aa_combine, combine1, unroll5aa_descr);
    add_combiner(unroll6aa_combine, combine1, unroll6aa_descr);
    add_combiner(unroll8aa_combine, combine1, unroll8aa_descr);
    add_combiner(simd_v1_combine, combine1, simd_v1_descr);
    add_combiner(simd_v2_combine, combine1, simd_v2_descr);
    add_combiner(simd_v4_combine, combine1, simd_v4_descr);
    add_combiner(simd_v8_combine, combine1, simd_v8_descr);
    add_combiner(simd_v12_combine, combine1, simd_v12_descr);
    add_combiner(simd_v2a_combine, combine1, simd_v2a_descr);
    add_combiner(simd_v4a_combine, combine1, simd_v4a_descr);
    add_combiner(simd_v8a_combine, combine1, simd_v8a_descr);
    log_combiner(simd_v8a_combine, 0.16, 0.24);
#endif
}







