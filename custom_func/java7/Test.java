// @ 출력 쓰기
package custom_func.java7;

public class Test {
	static int[] arr() {
		int a[] = new int[4];
		int b = a.length;
		for (int i = 0; i < b; i++)
			a[i] = i;
		return a;
	}

	public static void main(String[] args) {
		int a[] = arr();
		for (int i = 0; i < a.length; i++)
			System.out.print(a[i] + " ");
	}
}
