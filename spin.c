#include "types.h"
#include "user.h"

int fib(int n) 
{ 
   if (n <= 1) 
      return n; 
   return fib(n-1) + fib(n-2); 
} 

int main(int argc, char *argv[])
{
	int i;
	int x = 0;
	if(argc != 2)
	{
		exit();
	}
	for(i=1; i<atoi(argv[1]); i++)
	{
		x++;
                fib(x);
	}
	printf(1, "pid(%d): x = %d\n", getpid(), x);
	exit();
}
