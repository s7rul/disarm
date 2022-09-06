# Disarm

## Resources

- [ARMv6-M Architecture Reference Manual](https://developer.arm.com/documentation/ddi0419/latest/) (version E, DDI0419E_armv6m_arm.pdf)

## Notes

```shell
in app
> cargo build --example inc --release

in .
> llvm-objdump -S app/target/thumbv6m-none-eabi/release/examples/inc > inc.s
```