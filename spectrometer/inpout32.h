//#pragma once

//Functions exported from DLL.
//For easy inclusion is user projects.
//Original InpOut32 function support
void	_stdcall Out32(short PortAddress, short data);
short	_stdcall Inp32(short PortAddress);

//My extra functions for making life easy
short	_stdcall IsInpOutDriverOpen();  //Returns TRUE if the InpOut driver was opened successfully
short	_stdcall IsXP64Bit();			//Returns TRUE if the OS is 64bit (x64) Windows.

//DLLPortIO function support
unsigned char   _stdcall DlPortReadPortUchar (unsigned short port);
void    _stdcall DlPortWritePortUchar(unsigned short port, unsigned char Value);

unsigned short  _stdcall DlPortReadPortUshort (unsigned short port);
void    _stdcall DlPortWritePortUshort(unsigned short port, unsigned short Value);

unsigned long	_stdcall DlPortReadPortUlong(unsigned long port);
void	_stdcall DlPortWritePortUlong(unsigned long port, unsigned long Value);

//WinIO function support (Untested and probably does NOT work - esp. on x64!)
//PBYTE	_stdcall MapPhysToLin(PBYTE pbPhysAddr, DWORD dwPhysSize, HANDLE *pPhysicalMemoryHandle);
//BOOL	_stdcall UnmapPhysicalMemory(HANDLE PhysicalMemoryHandle, PBYTE pbLinAddr);
//BOOL	_stdcall GetPhysLong(PBYTE pbPhysAddr, PDWORD pdwPhysVal);
//BOOL	_stdcall SetPhysLong(PBYTE pbPhysAddr, DWORD dwPhysVal);





