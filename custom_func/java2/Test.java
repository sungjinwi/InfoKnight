// @ 출력
package custom_func.java2;

public class Test {
	static int[] mkarr() {
		int[] tmpArr = new int[4];
		for (int i = 0; i < tmpArr.length; i++)
			tmpArr[i] = i;
		return tmpArr;
	}

	public static void main(String[] args) {
		int[] arr;
		arr = mkarr();
		for (int i = 0; i < arr.length; i++)
			System.out.print(arr[i]);
	}
}

