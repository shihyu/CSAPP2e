/* $begin structvsunion-c */
struct S3 {
    char c;
    int i[2];
    double v;
};

union U3 {
    char c;
    int i[2];
    double v;
};
/* $end structvsunion-c */


/* $begin float2bit-c */
unsigned float2bit(float f)
{
    union {
	float f;
	unsigned u;
    } temp;
    temp.f = f;
    return temp.u;
};
/* $end float2bit-c */


/* $begin float2bitcopy-c */
unsigned copy(unsigned u) 
{ 
    return u; 
} 
/* $end float2bitcopy-c */


/* $begin bit2double-c */
double bit2double(unsigned word0, unsigned word1) 
{ 
    union { 
	double d; 
	unsigned u[2]; 
    } temp; 

    temp.u[0] = word0; 
    temp.u[1] = word1; 
    return temp.d; 
} 
/* $end bit2double-c */
