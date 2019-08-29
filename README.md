# FileDp

FileDp is a utility by @satishb3 (http://www.securitylearn.net) for file Data Protection class validation on iOS. 

Build on device (Chimera, iOS 12.4, iPhone 7):
1. add repo `https://jakeashacks.ga/cydia` and `https://coolstar.org/publicrepo`
2. install `theosinstaller` from it, check that `Make`, `LLVM+Clang` and other packages were also pulled
3. `# theosinstaller 10.3` in order to download the iPhone SDK (last available at the moment)
4. validate SDK path in makefile is correct
5. validate AFLAGS contains correct processor architecture (`armv7s` is for iPhone 7)
6. push files from this repo to the iOS device using SSH
7. in their directory `# make` in order to compile executable
8. `# chmod +x FileDP` in order to give executable permissions
9. `# ldid -Sentitlements.xml FileDP` in order to sign the binanry

Usage:
```
# ./FileDP -<f/d> <filepath/directorypath>
```
