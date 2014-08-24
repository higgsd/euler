# 49
m = 0
b = 1
f = 1
while f is not None:
    a = f
    f = None
    while True:
        x = str(a ** b)
        if len(x) > b:
            break
        if len(x) == b:
            if f is None:
                f = a
            m += 1
        a += 1
    b += 1
print m
