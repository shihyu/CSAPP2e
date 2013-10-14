/* $begin structbig-c */
struct {
    char     *a;
    short     b;
    double    c;
    char      d;
    float     e;
    char      f;
    long long g;
    void     *h;
/* $end structbig-c */
} foo_a;

/* $begin structlittle-c */
struct {
    double    c;
    long long g;
    float     e;
    char     *a;
    void     *h;
    short     b;
    char      d;
    char      f;
/* $begin structbig-c */
} foo;
/* $end structbig-c */
/* $end structlittle-c */


