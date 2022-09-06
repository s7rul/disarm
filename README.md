# Disarm

## Dependencies

- cargo binutils

## Resources

- [ARMv6-M Architecture Reference Manual](https://developer.arm.com/documentation/ddi0419/latest/) (version E, DDI0419E_armv6m_arm.pdf)

## Notes

In `app` folder:
```shell
> cargo objdump --example inc --release -- --disassemble > inc.asm
```