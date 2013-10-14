/* Which type of MOV instructions to use for different casts? */

#define CASTER(name, source, dest) \
    void name(source var, dest *p) { *p = (dest) var; }

CASTER(c2i, char, int)

CASTER(c2u, char, unsigned)

CASTER(uc2i, unsigned char, int)

CASTER(i2c, int, char)

CASTER(u2uc, unsigned, unsigned char)

