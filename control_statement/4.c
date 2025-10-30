// @ 정수를 역순으로 출력하는 C언어 프로그램, 0으로 끝나는 정수는 고려X
// (1) (2) (3)에 알맞은 연산자 쓰시오

#include <stdio.h>
int main()
{
	int number = 1234;
	int div = 10, result = 0;
	while (number( ① ) 0)
	{
		result = result * div;
		result = result + number( ② ) div;
		number = number( ③ ) div;
	}
	printf("%d", result);
}
