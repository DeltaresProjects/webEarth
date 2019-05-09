# cpp include fortran

## [Example](https://wiki.calculquebec.ca/w/C%2B%2B_:_appels_Fortran/en)

```bash
[name@server $] gfortran sum.f90 -c -o sum.o
[name@server $] g++ sum.o call_fortran.cpp -o a.out
[name@server $] ./a.out
```

## [grpc4bmi](https://grpc4bmi.readthedocs.io/en/latest/server/Cpp.html#fortran)

Fortran
In case you have a Fortran model, we advice to write the corresponding functions in Fortran first and export them to the implementation, e.g.

### my_bmi_model.f90

```fortran
subroutine get_component_name(name) bind(c, name="get_component_name_f")
    use, intrinsic ::iso_c_binding
    implicit none
    character(kind=c_char), intent(out) :: name(*)
    name(1:11)="Hello world"
    name(12)=c_null_char
```

Now it is possible to call this function from the BMI C implementation as follows,

### my_bmi_model.cc

```c
extern "C" void get_component_name_f(char*)
int MyBmiModel::get_component_name(char* name) const
{
    get_component_name_f(name);
    return BMI_SUCCESS;
}

```