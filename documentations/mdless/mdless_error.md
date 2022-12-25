
# Solving mdless error "cannt open shared object file" on raspberry pi

In /etc/ld.so.preload, comment le line:

```
/usr/lib/arm-linux-gnueabigh/libarmmem.so
```

to

```
#/usr/lib/arm-linux-gnueabigh/libarmmem.so
```
