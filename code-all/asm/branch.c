int silly(int x)
{
    while (x > 0) {
	x -= x >> 1;
	x += x << 1;
    }
    return x;
}

int main()
{
    return silly(2);
}
