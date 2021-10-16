---
title: 'Third Quarter Release of easifemClasses V21.3.0'
tags: [EASIFEM, Fortran]
style: border
color: primary
description: Third Quarter release of easifemClasses.
---

# Third Quarter Release of EASIFEM CLASSES V21.3.0 ❤️ 💯  

## Summary

This is 3rd Quarter release of `easifemClasses` in year 2021. `easifemClasses` is a work in progress, but it can be used by the users.

Work duration: July-2021 to Sept-2021

![](https://dm2302files.storage.live.com/y4mRcXnza7REhFo44vpNfzhLS_IfcYpRqXO5HS3YxPGnAzV8PVxb6jd7TgFZPi9S4ZNFKZ5Txb6-BBosJa5wsYiX4T3emEo_-pSozQCg1vbYWh8bdY_y3uGgL9G3WtP0TXwane35zUJFtAjunEgPRBQhfdZRp3T7RymAnJrQkO68jxxDZqKAut2iFoA5PXvyWYO?width=990&height=677&cropmode=none)

The summary of progress made in September 2021

![](https://dm2302files.storage.live.com/y4mYjI91hBqY6_u4dIdag_vPbLjEqadNhw4Bqq-psAT2T0zkptbyfmg6mnxQbLYI2pYbw45xkqhMBvktdzEwIJolIbt-ZBSQI2Id9ZOUb4ZO2waUEbrL-_Rp7vuKQSUNXwf-rXu2JagQqKQ2oPzYk9ib6VoMhLsfqP_1YXmuPTBTe0KW-5cqCPi_7RROMhx6xg1?width=967&height=491&cropmode=none)

Issued opened in Sept 2021

![](https://dm2302files.storage.live.com/y4m8tjUbcO_N-q27SyFYsAES6YwFamMpO948vd6XvJoAkr9FKginrnrteSf3P6gXa2_mDMv0JDKRfIDag0t7MbE8_0V3gSmL1jtUIPvpk-PJikaEZPnSmBxgQLMeBKXzKIQApAQJ3g_heWeg6W0POGA46chdCBw9OIqkWxH3bWsDTYjpKxDTynWKSauwtwOYiJg?width=959&height=648&cropmode=none)

Pull request made in Sept 2021

![](https://dm2302files.storage.live.com/y4mFJxAJSRN5abSNSe28LYEnkDT53yyyFq-sNrYJyUNqbhVGQHyMC74w4AeRvxH983uowdle4jwfR5IPM6uAcYQvp3ATsI75vS-bdieNtU0ITPDuxra0o4pqLLoWXCFj0G4Ma9Gw_s_2dFXokgkYsAudwtw3Mmdr5S5sMQ-ypLg0ixCdBpyfaOBFIbM0Rmv6cIi?width=931&height=668&cropmode=none)

## What is new?

This release includes the following features.

### Testing ⚙️ 

- [x] *tests/ tutorials** have been removed from this repository 🙉  
- [x] They are kept inside the `easifem-tests` directory, which is a different ongoing project 😎 

### Documentation 📖 

- [x]  Documentation is now picking up speed 🚀 🚄 . It will be over by the next release 👯 🪐 
- [x] New website has been developed 😄 , which contains the main documentation of the library. I will release it soon.

### Enhancements

- [x] CMake build support, both Unix Makefiles and Ninja generator works well 👍🏼 😆 
- [x] `.f90` extension now changed to `.F90`, this is necessary as we use preprocessing commands in the source files 😫 
- [x] New Sparse Matrix Structure and methods have been added
- [x] EASIFEM+METIS Interface is ready
- [x] CInterpolability 💯  New methods have been added to ease the C-interface writing part.
- [x] HDF5, TXTFile, InputFile, MSHFile has been added
- [x] Gmsh+Fortran API is added
- [x] All new implementation of `Mesh_` class
- [x] All new implementation of `Domain_` class
- [x] HDF5 based import and export
- [x] Fortran List, Pointer list, and many other template-based containers.

## What is next? ⚡ 🏛️ 

- [ ] I am working on CI-CD part, it will be done in the next release
- [ ] I have started building Test Driven Development, it will be done in the next release.
- [ ] 3D element support
- [ ] Further enhancements in the CSRMatrix
- [ ] Lapack and BLAS methods for `RealVector`, Fortran Vector, `RealMatrix_`, and `Fortran Array`
- [ ] Support for Higher-order element support
- [ ] Support for Mixed/Hybrid FEM
- [ ] DA32 support
- [ ] XDMF support
- [ ] STL support
- [ ] BlockMatrix and BlockNode Fields
- [ ] New linear solvers
- [ ] Eigen solvers
- [ ] Interface to LIS libraries

Regards
Vikas