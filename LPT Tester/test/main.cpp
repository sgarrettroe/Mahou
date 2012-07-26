#include <iostream>
#include <dos.h>
#include <stdio.h>
#include <conio.h>
#include <io.h>

using namespace std;

void pause() {
	for (int jj=0; jj<100000; jj++)
		int a=1;
}

int main()
{
    cout << "Running..." << endl;
    __asm__ ("mov 0x80, %al;"
			 "mov 0xC883, %dx;"
			 "out %al, %dx;");
    for ( int ii=0 ; ii<100 ; ii++ ){
    	cout << '-';
		__asm__ ("mov 0x07, %al;"
				 "mov 0xC883, %dx;"
				 "out %al, %dx;");
		pause();
		cout << '+';
		__asm__ ("mov 0x06, %al;"
				 "mov 0xC883, %dx;"
				 "out %al, %dx;");
		pause();
		}
}
