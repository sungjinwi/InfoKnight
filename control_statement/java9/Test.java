// @ n에 저장된 10진수 -> 2진수 변환,
// (1) (2) 에 알맞는 답

package control_statement.java9;

public class Test {
	public static void main(String[]args) {
		int a[] = new int[8];
		int i = 0;
		int n = 10;
		while( (①) ) {
			a[i++] = (②);
			n /= 2;
		}
		for(i = 7; i >= 0; i--)
			System.out.print(a[i]);
	}
}
