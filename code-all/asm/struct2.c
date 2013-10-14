/* $begin struct2-c */
struct prob {
    int *p;
    struct {
        int x;
        int y;
    } s;
    struct prob *next;
};
/* $end struct2-c */

/* $begin struct2-ans-c */
void sp_init(struct prob *sp)
{
    sp->s.x   = sp->s.y;
    sp->p     = &(sp->s.x);
    sp->next  = sp;
}
/* $end struct2-ans-c */

